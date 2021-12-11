// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nassek/colors.dart';

class Coaches extends StatelessWidget {
  Coaches({Key? key}) : super(key: key);
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery
        .of(context)
        .size
        .height;
    var responsiveWidth = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: colors.blue,
          ),
          body: ListView(
            children: [
              SizedBox(height: responsiveHeight * 0.03,),
              buildCoachesPadding(context, responsiveHeight, responsiveWidth),
              buildCoachesPadding(context, responsiveHeight, responsiveWidth),
              buildCoachesPadding(context, responsiveHeight, responsiveWidth),
              buildCoachesPadding(context, responsiveHeight, responsiveWidth),
            ],
          ),
        ));
  }

  Padding buildCoachesPadding(context, double responsiveHeight,
      double responsiveWidth) {
    return Padding(
      padding: EdgeInsets.all(responsiveHeight * 0.010),
      child: Container(
        decoration: BoxDecoration(
            border:
            Border.all(color: colors.grey, width: responsiveWidth * 0.004),
            borderRadius: BorderRadius.circular(responsiveWidth * 0.05)),
        height: responsiveHeight * 0.2,
        width: responsiveWidth * 0.8,
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed('coachDetails');
          },
          title: const Text('أسم المدرب'),
          subtitle: const Text('ظهور وصف المدرب بإختصار....'),
          trailing: CircleAvatar(
            child: Container(
              height: responsiveHeight * 0.3,
              width: responsiveWidth * 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
