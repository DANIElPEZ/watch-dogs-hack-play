import 'package:in_app_purchase/in_app_purchase.dart';
import 'dart:async';

class PurchaseRepository {
  final iap=InAppPurchase.instance;

  Future<ProductDetailsResponse> fecthProducts()async{
    final products=await iap.queryProductDetails({'donate1'});
    return products;
  }

  Future<void> MakeAndverifyPurchase(ProductDetails product) async {
    final purchaseParam =PurchaseParam(productDetails: product);
    final purchaseUpdate=iap.purchaseStream.asBroadcastStream();
    late StreamSubscription<List<PurchaseDetails>> subscription;

    subscription=purchaseUpdate.listen((purchases)async{
      for(final purchase in purchases){
        switch(purchase.status){
          case PurchaseStatus.pending:
            print('Purchase pending');
            break;
          case PurchaseStatus.purchased:
          case PurchaseStatus.restored:
            print('Purchase completed');
            final isValid=purchase.verificationData.serverVerificationData.isNotEmpty;
            if(isValid){
              if(purchase.pendingCompletePurchase) await iap.completePurchase(purchase);
              return;
            }else{
              print('Verification failed');
              await subscription.cancel();
              return;
            }
          case PurchaseStatus.error:
            print('Error: ${purchase.error}');
            await subscription.cancel();
            return;
          case PurchaseStatus.canceled:
            print('Purchase canceled');
            await subscription.cancel();
            return;
        }
      }
    });
    iap.buyNonConsumable(purchaseParam: purchaseParam);
    await Future.delayed(const Duration(seconds: 2));
  }
}