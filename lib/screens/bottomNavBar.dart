// ignore: file_names
// ignore_for_file: file_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nassek/colors.dart';
import 'package:nassek/providers.dart';
import 'package:nassek/screens/daily_advices.dart';
import 'package:nassek/screens/home_screen.dart';
import 'package:nassek/screens/profile_screen.dart';
import 'package:nassek/screens/register_screen.dart';
import 'package:nassek/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint('.......$index .....');
    });
  }

  List<Widget> _widgetOptions = <Widget>[Home(), DailyAdvices(), Profile()];
AppColors colors=AppColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.blue,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            activeIcon:Icon(Iconsax.home5),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.global_search),
            activeIcon:Icon(Iconsax.global_search5),
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
    );
  }
}
