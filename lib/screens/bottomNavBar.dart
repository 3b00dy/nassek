// ignore: file_names
// ignore_for_file: file_names, prefer_final_fields, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nassek/Provider_classes/days_provider.dart';
import 'package:nassek/colors.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
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
  String date = DateFormat('yyyy-MM-dd').format(DateTime.now());

  bool refresh = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint('.......$index .....');
    });
  }

  List<Widget> _widgetOptions = <Widget>[Home(), DailyAdvices(), Profile()];
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    if (Provider.of<DaysProvider>(context) == true) {
      setState(() {

      });
      Provider.of<DaysProvider>(context).refresh = false;
    }
    const String assetName = 'images/logo.svg';
    final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Logo');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: _selectedIndex == 0 ? const Text('الواجهة الرئيسية') : null,
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
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              activeIcon: Icon(Iconsax.home5),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.global_search),
              activeIcon: Icon(Iconsax.global_search5),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: '',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          selectedFontSize: 15,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
