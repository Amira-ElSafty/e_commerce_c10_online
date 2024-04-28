import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_online/domain/di.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/cart/cart_screen.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/product_details/product_details_view.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/home_tab/widgets/custom_text_field.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/product_list_tab/cubit/product_list_tab_states.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/product_list_tab/cubit/product_list_tab_view_model.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/product_list_tab/widgets/grid_view_card_item.dart';
import 'package:flutter_e_commerce_c10_online/ui/utils/my_assets.dart';
import 'package:flutter_e_commerce_c10_online/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  ProductListTabViewModel viewModel = ProductListTabViewModel(
      getAllProductsUseCase: injectGetAllProductsUseCase(),
  addCartUseCase: injectAddCartUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListTabViewModel>(
      create: (context) => viewModel..getAllProducts(),
      child: BlocBuilder<ProductListTabViewModel,ProductListTabStates>(
        builder: (context,state){
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Image.asset(
                      MyAssets.logo,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(children: [
                      Expanded(
                        child: CustomTextField(),
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(CartScreen.routeName)
;                        },
                        child: Badge(
                          label: Text(viewModel.numOfCartItem.toString()),
                          child: ImageIcon(
                            AssetImage(MyAssets.shoppingCart),
                            size: 28.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 24.h,
                    ),
                    state is ProductLoadingState?
                        Center(child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),):
                    Expanded(
                      child: GridView.builder(
                        itemCount: viewModel.productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.4,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.h),
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                ProductDetailsView.routeName,
                                arguments: viewModel.productList[index]
                              );
                            },
                            child: GridViewCardItem(productEntity: viewModel.productList[index]),
                          );
                        },
                      ),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
