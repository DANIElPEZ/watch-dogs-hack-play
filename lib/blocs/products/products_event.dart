import 'package:in_app_purchase/in_app_purchase.dart';

abstract class PurchaseEvent {}

class LoadProducts extends PurchaseEvent {}

class MakeAndVerifyPurchase extends PurchaseEvent {
  final ProductDetails product;
  MakeAndVerifyPurchase(this.product);
}