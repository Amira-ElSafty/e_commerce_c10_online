import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c10_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_item.dart';

class CategoriesOrBrandsSection extends StatelessWidget {
  //todo: List<Category & brand>
  List<CategoryOrBrandEntity> list ;
  CategoriesOrBrandsSection({required this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryOrBrandItem(categoryOrBrandEntity:list[index] ,);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          )),
    );
  }
}
