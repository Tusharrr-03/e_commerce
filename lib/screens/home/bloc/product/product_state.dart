import 'package:e_commerce/data/remote/models/product_model.dart';

abstract class ProductState{}

class ProductInitialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductSuccessState extends ProductState{
  List<ProductModel> products;
  ProductSuccessState({required this.products});
}
class ProductFailureState extends ProductState{
  String errMsg;
  ProductFailureState({required this.errMsg});
}