import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/home_tab/widgets/custom_text_field.dart';
import 'package:flutter_e_commerce_c10_online/ui/utils/my_assets.dart';
import 'package:flutter_e_commerce_c10_online/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchWithShoppingCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(),
        ),
        SizedBox(
          width: 24.w,
        ),
        InkWell(
          onTap: () {},
          child: ImageIcon(
            AssetImage(MyAssets.shoppingCart),
            size: 28.sp,
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}
