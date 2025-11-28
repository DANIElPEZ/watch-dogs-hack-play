import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ctoshackcity/blocs/products/products_state.dart';
import 'package:ctoshackcity/blocs/products/products_event.dart';
import 'package:ctoshackcity/repository/purchase_repository.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  final PurchaseRepository purchaseRepository;
  late StreamSubscription<dynamic> streamSubscription;

  PurchaseBloc({required this.purchaseRepository}) : super(PurchaseState.initial()) {
    on<LoadProducts>((event, emit) async {
      final products=await purchaseRepository.fecthProducts();
      emit(state.copyWith(products: products));
    });
    on<MakeAndVerifyPurchase>((event, emit) async {
      await purchaseRepository.MakeAndverifyPurchase(event.product);
    });
  }
}