// ignore: file_names
// ignore_for_file: file_names, prefer_final_fields, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nassek/Provider_classes/days_provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:nassek/colors.dart';
import 'package:provider/provider.dart';
import 'package:nassek/screens/daily_advices.dart';
import 'package:nassek/screens/home_screen.dart';
import 'package:nassek/screens/profile_screen.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  bool refresh = false;

  void _onItemTapped(int index) {


    setState(() {
      _selectedIndex = index;

    });
  }
  List<Widget> _widgetOptions = <Widget>[Home(), DailyAdvices(), Profile()];
  List<Widget> _title = <Widget>[Text('الواجهة الرئيسية'), Text('النصائح اليومية'), Text('الملف الشخصي')];

  AppColors colors = AppColors();

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    if (Provider.of<DaysProvider>(context,listen: false) == true) {
      setState(() {

      });
      Provider.of<DaysProvider>(context,listen: false).refresh = false;
    }
    const String assetName = 'images/logo.svg';
    final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Logo');
    return
      SafeArea(
      child:

      Scaffold(
        appBar: AppBar(
          title:
          _title[_selectedIndex],
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: colors.blue,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              child: svg,
              backgroundColor: colors.white,
            ),
          ),
        ),

        bottomNavigationBar:
        CurvedNavigationBar(
          height: MediaQuery.of(context).size.height*0.08,
            backgroundColor:colors.blue,
          animationDuration:Duration(milliseconds: 350),
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Iconsax.home, size: 25),
          Icon(Iconsax.global_search, size: 25),
          Icon(Iconsax.user, size: 25),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
          body: Center(
      child: _widgetOptions.elementAt(_selectedIndex ),
    ),

      ),
    );
  }
}
