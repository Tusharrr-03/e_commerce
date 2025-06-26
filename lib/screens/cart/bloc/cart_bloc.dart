import 'dart:io';
import 'package:e_commerce/data/remote/helper/app_exception.dart';
import 'package:e_commerce/data/remote/repository/cart_repo.dart';
import 'package:e_commerce/screens/cart/bloc/cart_event.dart';
import 'package:e_commerce/screens/cart/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepo cartRepo;

  CartBloc({required this.cartRepo}) : super(CartInitialState()) {
    on<AddToCartEvent>((event, emit) async {
      emit(CartLoadingState());

      try {
        dynamic res = await cartRepo.addToCart(
          productId: event.productId,
          qty: event.qty,
        );

        if(res["status"] == "true" || res["status"]){
          emit(CartLoadingState());
        } else{
          emit(CartFailureState(errMsg: res["message"]));
        }
      } on SocketException catch (e) {
        throw NoInternetException(errorMessage: e.toString());
      } catch (e,stackTrace) {
        emit(CartFailureState(errMsg: e.toString()));
        print("StackTrace : $stackTrace");
      }
    });
  }
}
