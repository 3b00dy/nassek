// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nassek/Provider_classes/types_of_diets.dart';
import 'package:nassek/api_models/dietsTypes.dart';
import 'package:nassek/colors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DietTypes extends StatelessWidget {
  DietTypes({Key? key}) : super(key: key);
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    const String assetName = 'images/logo.svg';
    final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Logo');
    Diets diets=Diets();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.blue,
      ),
      body: Consumer<TypesOfDiets>(
        builder: (context,type,_) {
          return Column(
            children: [
              SizedBox(
                  height: responsiveHeight * 0.5,
                  width: responsiveWidth * 0.8,
                  child: svg),
              SizedBox(
                height: responsiveHeight * 0.02,
              ),
              buildElevatedButton(
                  responsiveHeight, responsiveWidth, context, '${type.dites![0].title}',type.dites![0].url),
            buildElevatedButton(
                  responsiveHeight, responsiveWidth, context, '${type.dites![0].title}',type.dites![0].url),
            buildElevatedButton(
                  responsiveHeight, responsiveWidth, context, '${type.dites![0].title}',type.dites![0].url),

            ],
          );
        }
      ),
    ));
  }

  Widget buildElevatedButton(
          responsiveHeight, responsiveWidth, context, buttonName,url) =>
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
            onPressed: ()async{
                  await launch(url);
                } ,
            child: Text(
              buttonName,
              style: TextStyle(color: colors.black),
            ),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0.0),
              backgroundColor: MaterialStateProperty.all<Color>(colors.white),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    side: BorderSide(color: colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(responsiveWidth * 0.05),
                    )),
              ),
            ),
          ),
        ),
      );
}
