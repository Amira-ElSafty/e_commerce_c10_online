import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/use_cases/add_cart_use_case.dart';
import 'package:flutter_e_commerce_c10_online/domain/use_cases/get_all_products_use_case.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/product_list_tab/cubit/product_list_tab_states.dart';

class ProductListTabViewModel extends Cubit<ProductListTabStates>{
  GetAllProductsUseCase getAllProductsUseCase ;
  AddCartUseCase addCartUseCase ;
  ProductListTabViewModel({required this.getAllProductsUseCase,
  required this.addCartUseCase}):super(ProductInitialState());
  // todo: hold data - handle logic
  List<ProductEntity> productList = [];
  int numOfCartItem = 0 ;

  static ProductListTabViewModel get(context) => BlocProvider.of(context);

  void getAllProducts()async{
    emit(ProductLoadingState(loadingMessage: 'Loading...'));
    var either = await getAllProductsUseCase.invoke();
    either.fold((l) => emit(ProductErrorState(errors: l)),
            (response) {
      productList = response.data ?? [];
      emit(ProductSuccessState(productResponseEntity: response));
            });
  }

  void addToCart(String productId)async{
    emit(AddToCartLoadingState(loadingMessage: 'Loading...'));
    var either = await addCartUseCase.invoke(productId);
    either.fold((l) => emit(AddToCartErrorState(errors: l)),
            (response) {
      // productList = response.data ?? [];
        numOfCartItem = response.numOfCartItems!.toInt() ;
        print('NumOfCartItems: $numOfCartItem');
        emit(AddToCartSuccessState(addCartResponseEntity: response));
            });
  }
}