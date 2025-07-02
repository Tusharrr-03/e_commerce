import 'dart:convert';
import 'dart:io';
import 'package:e_commerce/data/remote/helper/app_exception.dart';
import 'package:e_commerce/data/remote/models/cart_model.dart';
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
          emit(CartSuccessState());
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

    /// FetchCart
    on<FetchAllItemsEvents>((event, emit) async{
      emit(CartLoadingState());

      try{
        dynamic res = await cartRepo.fetchCart();

        if(res["status"]){

          List<CartModel> mCart = [];
          for(Map<String, dynamic> eachItem in res['data']){
            mCart.add(CartModel.fromJson(eachItem));
          }
          emit(CartLoadedState(mCartList: mCart));
        } else{
          emit(CartFailureState(errMsg: res["message"]));
        }
      } catch(e, stackTrace){
        emit(CartFailureState(errMsg: e.toString()));
        print("StackTrace : $stackTrace");
      }
    });

    on<DeleteItemEvent>((event, emit) async{
      emit(CartLoadingState());

      try{
        List<CartModel> upDatedList = [];
        upDatedList.removeWhere((item) => item.id == event.productIndex);
        emit(CartLoadedState(mCartList: upDatedList));
      } catch(e) {
        emit(CartFailureState(errMsg: e.toString()));
      }

    });

    on((event, emit) async{
      emit(CartLoadingState());

      try{

      } catch(e) {

      }
    });
  }
}
