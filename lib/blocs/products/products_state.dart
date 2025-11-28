import 'package:in_app_purchase/in_app_purchase.dart';

class PurchaseState {
    final ProductDetailsResponse products;

  const PurchaseState({required this.products});

  factory PurchaseState.initial() => PurchaseState(
    products: ProductDetailsResponse(
      productDetails: const <ProductDetails>[],
      notFoundIDs: const <String>[],
    ),
  );

  PurchaseState copyWith({
    ProductDetailsResponse? products,
  }) {
    return PurchaseState(
      products: products ?? this.products,
    );
  }
}