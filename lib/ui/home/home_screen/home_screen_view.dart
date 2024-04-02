import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/home_screen/cubit/home_states.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/home_screen/widget/custom_bottom_navigation_bar.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/favorite_tab/favorite_tab.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/home_tab/home_tab.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/product_list_tab/product_list_tab.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/tabs/profile_tab/profile_tab.dart';

class HomeScreenView extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel,HomeStates>(
      bloc: viewModel,
        builder: (context,state){
          return Scaffold(
            bottomNavigationBar: buildCustomBottomNavigationBar(
              context: context,
              selectedIndex: viewModel.selectedIndex,
              onTapFunction: (index) {
                viewModel.changeTabs(index);
              },
            ),
            body: viewModel.tabs[viewModel.selectedIndex],
          );
        }
    );

  }
}
