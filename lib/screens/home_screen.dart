// ignore_for_file: must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nassek/Provider_classes/days_provider.dart';
import 'package:nassek/api_models/loading_State.dart';
import 'package:nassek/colors.dart';
import 'package:nassek/screens/search_screen.dart';

import 'package:percent_indicator/percent_indicator.dart';

import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<DaysProvider>(
            builder: (BuildContext context, value, child) {
              if (value.loadingState == LoadingState.idle) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          value.len == -1
                              ? Text(
                                  '${DateTime.now().toIso8601String().split('T')[0]}')
                              : Text(
                                  '${value.day![value.len].date!.toIso8601String().split('T')[0]}'),
                          // Text('${Provider.of<GetAllDates>(context).printedDate}'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          const Icon(Iconsax.calendar),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Iconsax.arrow_circle_right),
                          onPressed: () {
                            value.nextDay();
                          },
                        ),
                        buildCircularPercentIndicator(
                            context,
                            MediaQuery.of(context).size.height * 0.20,
                            colors.indicatorCyan,
                            'سعرة حرارية',
                            value.len==-1?0.0: value.day![value.len].totalCalories ?? 0.0),
                        IconButton(
                          icon: const Icon(Iconsax.arrow_circle_left),
                          onPressed: () {
                            value.previousDay();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildCircularPercentIndicator(
                            context,
                            MediaQuery.of(context).size.height * 0.15,
                            colors.purple,
                            'بروتين',
                            value.len==-1?0.0: value.day![value.len].totalProtein ?? 0.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                        buildCircularPercentIndicator(
                            context,
                            MediaQuery.of(context).size.height * 0.15,
                            colors.green,
                            'دهون',
                            value.len==-1?0.0: value.day![value.len].totalFat ?? 0.0),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03,
                              right: MediaQuery.of(context).size.width * 0.08),
                          child: Text("إضافة وجبة",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.03)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.10,
                          right: size.width * 0.10,
                          top: size.height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          buildMealButtons(context, 'الفطور', 'b'),
                          buildMealButtons(context, 'الغداء', 'l'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.10,
                          right: size.width * 0.10,
                          top: size.height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          buildMealButtons(context, 'العشاء', 'd'),
                          buildMealButtons(context, 'الوجبات الخفيفة', 's'),
                        ],
                      ),
                    )
                  ],
                );
              }
            },
            // child: ,
          ),
        ),
      ),
    );
  }

  InkWell buildMealButtons(context, mealName, tagName) {
    return InkWell(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Search(
                      tag: tagName,
                    )))
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: colors.grey,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(mealName),
        ),
      ),
    );
  }

  Widget buildCircularPercentIndicator(
      context, rad, progressColors, String text, percentage) {
    return SizedBox(
      child: CircularPercentIndicator(
        radius: rad,
        animation: true,
        animationDuration: 700,
        lineWidth: 12.0,
        percent: (percentage * 0.0001),
        center: Text(
          '$text ${percentage.toStringAsFixed(0)}',
          style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
        ),
        progressColor: progressColors,
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
