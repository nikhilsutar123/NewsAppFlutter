import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:news_app/bloc/bottom_navigation_bloc/bottom_navigation_event.dart';
import 'package:news_app/bloc/bottom_navigation_bloc/bottom_navigation_state.dart';
import 'package:news_app/bloc/snack_bar_bloc/snackbar_bloc.dart';
import 'package:news_app/bloc/snack_bar_bloc/snackbar_state.dart';
import 'package:news_app/res/colors.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/util/app_functions.dart';
import 'package:news_app/view/headlines_screen/headlines_homescreen.dart';
import 'package:news_app/view/saved_news/saved_news_list.dart';
import 'package:news_app/view/search_news_screen/search_news_screen.dart';

import '../../res/constant.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List<Widget> _screens = [
    const HeadlinesHomescreen(),
    const SearchNewsScreen(),
    const SavedNewsList()
  ];

  BottomNavigationBarItem _buildNavItem(
      String assetImage, bool isActive, String label) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          assetImage,
          colorFilter: ColorFilter.mode(
              isActive ? Appcolor.primaryColor : Appcolor.black,
              BlendMode.srcIn),
        ), 
        label: label);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (BuildContext context, state) {
        return BlocListener<SnackbarBloc, SnackbarState>(
          listenWhen: (prev,curr) => curr.message.isNotEmpty,
          listener: (BuildContext context, SnackbarState state) {
            if(state.message.isNotEmpty){
              showSnackBar(context, state.message);
            }
          },
          child: Scaffold(
            body: _screens[state.selectedIndex],
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
              ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.shifting,
                  currentIndex: state.selectedIndex,
                  onTap: (index) {
                    context.read<BottomNavigationBloc>().add(NavigateTo(index));
                  },
                  selectedItemColor: Appcolor.primaryColor,
                  selectedLabelStyle: textThemeBlackBold(14),
                  unselectedLabelStyle: textThemeBlackBold(13),
                  items: [
                    _buildNavItem(Constant.homescreenIcon,
                        state.selectedIndex == 0, "Home"),
                    _buildNavItem(Constant.searchNewsIcon,
                        state.selectedIndex == 1, "Search"),
                    _buildNavItem(Constant.savedNewsIcon,
                        state.selectedIndex == 2, "Saved"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
