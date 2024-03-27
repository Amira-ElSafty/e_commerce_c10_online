import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/home_tab/widgets/annountcements_section.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/home_tab/widgets/categories_or_brands_section.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/home_tab/widgets/custom_search_with_shopping_cart.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/home_tab/widgets/row_section_widgets.dart';
import 'package:flutter_e_commerce_c10_online/ui/utils/my_assets.dart';
import 'package:flutter_e_commerce_c10_online/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
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
              CustomSearchWithShoppingCart(),
              SizedBox(
                height: 16.h,
              ),
              AnnouncementsSection(),
              SizedBox(
                height: 16.h,
              ),
              RowSectionWidget(name: 'Categories'),
              SizedBox(
                height: 24.h,
              ),
              CategoriesOrBrandsSection(),
              SizedBox(
                height: 24.h,
              ),
              RowSectionWidget(name: 'Brands'),
              SizedBox(
                height: 24.h,
              ),
              CategoriesOrBrandsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
