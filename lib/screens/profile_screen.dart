// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nassek/Provider_classes/get_profile.dart';
import 'package:nassek/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'coach_details.dart';

class Profile extends StatelessWidget {
   Profile({Key? key}) : super(key: key);
AppColors colors=AppColors();
  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Image.asset(
                Provider.of<GetProfile>(context).profile.gender=='Male'?
                'images/man.png':'images/women.png',
                width: responsiveWidth * 0.5,
                height: responsiveHeight * 0.35,
              ),
            ),
            const Center(
              child: Text('اسم الشخص'),
            ),
            SizedBox(height: responsiveHeight*0.03,),
            buildElevatedButton(responsiveHeight, responsiveWidth, context,
                'المعلومات الشخصية','personalInfo'),
            buildElevatedButton(responsiveHeight, responsiveWidth, context,
                'انواع الحمية الغذائية ','dietTypes'),
            buildElevatedButton(
                responsiveHeight, responsiveWidth, context, 'المدربين','coachesScreen'),
          ],
        ),
      ),
    );
  }

  Widget buildElevatedButton(
          responsiveHeight, responsiveWidth, context, buttonName,routeName) =>
      Padding(
        padding: EdgeInsets.only(
            top: responsiveHeight * 0.012,
            bottom: responsiveHeight * 0.006,
            left: responsiveWidth * 0.05,
            right: responsiveWidth * 0.05),
        child: SizedBox(
          height: responsiveHeight * 0.09,
          width: responsiveHeight * 0.6,
          child: ElevatedButton(
            onPressed: () {

              Navigator.pushNamed(context, routeName);
              },
            child: Text(buttonName,style: TextStyle(color: colors.black),),
            style: ButtonStyle(elevation:MaterialStateProperty.all<double>(0.0) ,
              backgroundColor: MaterialStateProperty.all<Color>(colors.white),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(

                    side: BorderSide(color: colors.grey),
                      borderRadius: BorderRadius.all(
                Radius.circular(responsiveWidth*0.05),
              )),
              ),
            ),
          ),
        ),
      );
}
