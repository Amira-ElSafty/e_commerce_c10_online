import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c10_online/ui/home/home_screen/cubit/home_states.dart';

import '../../tabs/favorite_tab/favorite_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/product_list_tab/product_list_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeStates>{
  HomeScreenViewModel():super(HomeInitialState());
  //todo: hold data - handle logic
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  void changeTabs(int newSelectedIndex){
    emit(HomeInitialState());
    selectedIndex = newSelectedIndex ;
    emit(ChangeBottomNavigationBarStates());
  }
}