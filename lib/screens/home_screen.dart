// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nassek/colors.dart';
import 'package:nassek/dummyData.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  AppColors colors = AppColors();
var masures=[
  Food(200, 27, 10, 'Burger', 'Delecious'),
  Food(300, 27, 10, 'Burger', 'Delecious'),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(DateFormat("yyyy-MM-dd").format(DateTime.now())),

                    SizedBox(width:  MediaQuery.of(context).size.width*0.1,),
                    Icon(Iconsax.calendar),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.19, right:  MediaQuery.of(context).size.width*0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Iconsax.arrow_circle_right),
                      onPressed: () {


                      },
                    ),
                    buildCircularPercentIndicator(context,
                        MediaQuery.of(context).size.height*0.17, colors.indicatorCyan, 'سعرة حرارية',masures[0].carbs),
                    IconButton(
                      icon: const Icon(Iconsax.arrow_circle_left),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
               SizedBox(
                height:  MediaQuery.of(context).size.height*0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCircularPercentIndicator( context,MediaQuery.of(context).size.height*0.13, colors.purple, 'بروتين',masures[0].protin),
                   SizedBox(
                    width: MediaQuery.of(context).size.width*0.25,
                  ),
                  buildCircularPercentIndicator(context,MediaQuery.of(context).size.height*0.13, colors.green, 'دهون',masures[0].fat),
                ],
              ),
              Row(
                children:  [
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03, right: MediaQuery.of(context).size.width*0.08),
                    child: Text("إضافة وجبة", style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.03)),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    buildMealButtons(context,'الفطور'),
                    buildMealButtons(context,'الغداء'),
                  ],
                ),
              ),
              Padding(
                padding:
                     EdgeInsets.only(left: 40.0, right: 40.0, top: MediaQuery.of(context).size.height*0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    buildMealButtons(context,'العشاء'),
                    buildMealButtons(context,'الوجبات الخفيفة'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildMealButtons(context,mealName) {
    return InkWell(
      onTap: () => {Navigator.pushNamed(context, 'searchScreen')},
      child: Container(
        height: MediaQuery.of(context).size.height*0.1,
        width: MediaQuery.of(context).size.height*0.19,
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

  CircularPercentIndicator buildCircularPercentIndicator(context,
      rad, progressColors, String text,var percentage) {
    return CircularPercentIndicator(
      radius: rad,
      // startAngle: 220,
      // curve:Curves.ease,
      animation: true,
      animationDuration: 900,
      lineWidth: 12.0,
      percent: 0.4,
      center: Text('$text $percentage',style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.02),),
      progressColor: progressColors,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
