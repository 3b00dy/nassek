import 'package:flutter/material.dart';
import 'package:nassek/colors.dart';

class DailyAdvices extends StatelessWidget {
  DailyAdvices({Key? key}) : super(key: key);

  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    return SafeArea(

        child: Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(responsiveHeight * 0.025),
            child: Container(
              decoration: BoxDecoration(
                  // color: colors.grey,
                  border: Border.all(
                      color: colors.grey, width: responsiveWidth * 0.004),
                  borderRadius: BorderRadius.circular(responsiveWidth * 0.1)),
              height: responsiveHeight * 0.2,
              width: responsiveWidth * 0.8,
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'adviceScreen');
                },
                title: Text('عنوان النصيحة'),
                subtitle: Text('ظهور النصيحة بشكل كامل....'),
                leading: CircleAvatar(
                  child: Container(),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
