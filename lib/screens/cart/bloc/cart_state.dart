import 'package:e_commerce/data/remote/models/cart_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {}

class CartLoadedState extends CartState {
  List<CartModel> mCartList = [];
  /*double total;
  double subtotal;*/
  CartLoadedState({required this.mCartList});

  /*@override
  List<Object?> get props => [mCartList, total, subtotal];*/
}

class CartFailureState extends CartState {
  String errMsg;

  CartFailureState({required this.errMsg});
}
