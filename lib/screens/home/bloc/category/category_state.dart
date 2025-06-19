import 'package:e_commerce/data/remote/models/cat_model.dart';

abstract class CategoryState{}

class InitialCategoryState extends CategoryState{}
class LoadingCategoryState extends CategoryState{}
class SuccessCategoryState extends CategoryState{
  List<CatModel> category;
  SuccessCategoryState({required this.category});
}
class FailureCategoryState extends CategoryState{
  String errMsg;
  FailureCategoryState({required this.errMsg});
}