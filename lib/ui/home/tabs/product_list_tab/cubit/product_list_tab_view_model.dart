import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/use_cases/get_all_products_use_case.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/product_list_tab/cubit/product_list_tab_states.dart';

class ProductListTabViewModel extends Cubit<ProductListTabStates>{
  GetAllProductsUseCase getAllProductsUseCase ;
  ProductListTabViewModel({required this.getAllProductsUseCase}):super(ProductInitialState());
  // todo: hold data - handle logic
  List<ProductEntity> productList = [];

  void getAllProducts()async{
    emit(ProductLoadingState(loadingMessage: 'Loading...'));
    var either = await getAllProductsUseCase.invoke();
    either.fold((l) => emit(ProductErrorState(errors: l)),
            (response) {
      productList = response.data ?? [];
      emit(ProductSuccessState(productResponseEntity: response));
            });
  }
}