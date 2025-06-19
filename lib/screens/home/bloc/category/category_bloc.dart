import 'package:e_commerce/data/remote/models/cat_model.dart';
import 'package:e_commerce/data/remote/repository/category_repo.dart';
import 'package:e_commerce/screens/home/bloc/category/category_event.dart';
import 'package:e_commerce/screens/home/bloc/category/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBloc extends Bloc<CategoryEvent, CategoryState>{
  CatRepo catRepo;
  CatBloc({required this.catRepo}) : super(InitialCategoryState()){
    on<GetAllCategoriesEvent>((event, emit) async{
      emit(LoadingCategoryState());

      try{
        dynamic res = await catRepo.getAllCat();
        print("Cat Res : $res");

        if(res['status']){
          var dataModel = CatDataModel.fromJson(res);
          emit(SuccessCategoryState(category: dataModel.data ?? []));
        } else{
          emit(FailureCategoryState(errMsg: res['message']));
        }

      } catch (e, stackTrace) {
        print("CatBloc Error: $e\n$stackTrace");
        emit(FailureCategoryState(errMsg: "Something went wrong!"));
      }

    });
  }
}