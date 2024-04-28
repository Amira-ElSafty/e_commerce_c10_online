import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_online/domain/di.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/cart/cubit/cart_screen_view_model.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/cart/cubit/cart_states.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/cart/widget/cart_item.dart';
import 'package:flutter_e_commerce_c10_online/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart-screen';
 CartScreenViewModel viewModel = CartScreenViewModel(
     getCartUseCase: injectGetCartUseCase(),
 updateCountInCartUseCase: injectUpdateCountInCartUseCase(),
 deleteItemInCartUseCase: injectDeleteItemInCartUseCase());
 @override
  Widget build(BuildContext context) {
    return BlocProvider<CartScreenViewModel>(
      create: (context) => viewModel..getCart(),
      child: BlocBuilder<CartScreenViewModel,CartStates>(
        builder: (context,state){
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    // Button logic here
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
                ),
                title: Text(
                  'Cart',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      // Button logic here
                    },
                    icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                  ),
                  IconButton(
                    onPressed: () {
                      // Button logic here
                    },
                    icon: const Icon(Icons.shopping_cart_outlined,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
              body: state is GetCartSuccessState ?
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CartItem(cartEntity:
                        state.responseEntity.data!.products![index],);
                      },
                      itemCount: state.responseEntity.data!.products!.length,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 98.h, left: 16.w, right: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: Text('Total Price',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: AppColors.greyColor)),
                            ),
                            Text('EGP ${state.responseEntity.data!.totalCartPrice}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor)),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            //logic here
                          },
                          child: Container(
                            height: 48.h,
                            width: 270.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Theme.of(context).primaryColor),
                            child: Padding(
                              padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 83.w),
                                    child: Text('Check out',
                                        style:
                                        Theme.of(context).textTheme.titleMedium),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 27.w, right: 32.w),
                                    child: Icon(Icons.arrow_forward,
                                        size: 20.w, color: AppColors.whiteColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
                  : const Center(child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),)
          );
        },
      ),
    );
  }
}
