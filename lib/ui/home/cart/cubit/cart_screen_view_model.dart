import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerce_c10_online/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:flutter_e_commerce_c10_online/domain/use_cases/get_cart_use_case.dart';
import 'package:flutter_e_commerce_c10_online/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/cart/cubit/cart_states.dart';

class CartScreenViewModel extends Cubit<CartStates>{
  GetCartUseCase getCartUseCase ;
  DeleteItemInCartUseCase deleteItemInCartUseCase ;
  UpdateCountInCartUseCase updateCountInCartUseCase ;

  CartScreenViewModel({required this.getCartUseCase,
  required this.deleteItemInCartUseCase,
  required this.updateCountInCartUseCase}):super(CartInitialState());

  //todo: hold data - handle logic
  List<GetProductCartEntity> productList = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

  getCart()async{
    emit(GetCartLoadingState(loadingMessage: 'Loading...'));
    var either = await getCartUseCase.invoke();
    either.fold((l) => emit(GetCartErrorState(errors: l)),
            (response) {
      productList = response.data!.products! ;
      emit(GetCartSuccessState(responseEntity: response));
            });
  }

  deleteItemInCart(String productId)async{
    emit(DeleteItemInCartLoadingState(loadingMessage: 'Loading...'));
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((l) => emit(DeleteItemInCartErrorState(errors: l)),
            (response) {
      // productList = response.data!.products! ;
              print('deleted item successfully');
      emit(GetCartSuccessState(responseEntity: response));
            });
  }

  updateCountInCart(int count,String productId)async{
    emit(UpdateCountInCartLoadingState(loadingMessage: 'Loading...'));
    var either = await updateCountInCartUseCase.invoke(count,productId);
    either.fold((l) => emit(UpdateCountInCartErrorState(errors: l)),
            (response) {
      // productList = response.data!.products! ;
              print('deleted item successfully');
      emit(GetCartSuccessState(responseEntity: response));
            });
  }

}