import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/use_cases/get_all_brands_use_case.dart';
import 'package:flutter_e_commerce_c10_online/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/home_tab/cubit/home_tab_states.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{
  GetAllCategoriesUseCase categoriesUseCase ;
  GetAllBrandsUseCase brandsUseCase ;
  HomeTabViewModel({required this.categoriesUseCase,
  required this.brandsUseCase}):super(HomeTabInitialState());
  //todo: hold data - handle logic
  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  void getAllCategories()async{
    emit(CategoryLoadingState(loadingMessage: 'Loading...'));
    var either = await categoriesUseCase.invoke();
    either.fold((l) => emit(CategoryErrorState(errors: l)),
            (response) {
      categoriesList = response.data ?? [];
      emit(CategorySuccessState(categoryResponseEntity: response));
            }
    );
  }

  void getAllBrands()async{
    emit(BrandLoadingState(loadingMessage: 'Loading...'));
    var either = await brandsUseCase.invoke();
    either.fold((l) => emit(BrandErrorState(errors: l)),
            (response) {
      brandsList = response.data ?? [];
      emit(BrandSuccessState(categoryResponseEntity: response));
            }
    );
  }
}