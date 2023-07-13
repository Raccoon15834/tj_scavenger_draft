import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'main.dart';

FluidNavBar buildNav(MyHomePageState state){
  void _handleNavigationChange(int index) {
    state.setState(() {
      state.page = index;
      // _child = AnimatedSwitcher(
      //   switchInCurve: Curves.easeOut,
      //   switchOutCurve: Curves.easeIn,
      //   duration: Duration(milliseconds: 500),
      //   child: _child,
      // );
    });
  }
  FluidNavBar bob = FluidNavBar(
    icons: [
      FluidNavBarIcon(icon: const IconData(0xf7f5, fontFamily: 'MaterialIcons')),
      FluidNavBarIcon(icon: const IconData(0xf8f0, fontFamily: 'MaterialIcons')),
      FluidNavBarIcon(icon: const IconData(0xeeae, fontFamily: 'MaterialIcons')),
      FluidNavBarIcon(icon: const IconData(0xf0127, fontFamily: 'MaterialIcons')),
    ],
    style: const FluidNavBarStyle(
        barBackgroundColor: Color(0xFF6F2E34),
        iconBackgroundColor: Color(0xFFEFE0CB),
        iconSelectedForegroundColor: Color(0xFF6F2E34),
        iconUnselectedForegroundColor: Colors.black
    ),
    onChange: _handleNavigationChange,
    animationFactor: 0.5,
  );

  return bob;
}
