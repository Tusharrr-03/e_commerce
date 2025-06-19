import 'package:e_commerce/data/remote/models/product_model.dart';
import 'package:e_commerce/data/remote/repository/product_repo.dart';
import 'package:e_commerce/screens/home/bloc/product/product_event.dart';
import 'package:e_commerce/screens/home/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{
  ProductRepo productRepo;
   ProductBloc({required this.productRepo}) : super(ProductInitialState()){
     on<GetAllProductEvent>((event, emit) async{
       emit(ProductLoadingState());

       try{
         dynamic res = await productRepo.getAllProducts();
         print("Resources to Print : $res");
         if(res['status']){
           var dataModel = ProductDataModel.fromJson(res);
            emit(ProductSuccessState(products: dataModel.data ?? []));
         } else{
           emit(ProductFailureState(errMsg: res['message']));
         }

       } catch (e){
          emit(ProductFailureState(errMsg: e.toString()));
       }

     });
   }

}