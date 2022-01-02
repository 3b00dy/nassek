// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nassek/colors.dart';


class CoachDetails extends StatelessWidget {
  String coachName, coachDescribe;

  CoachDetails({Key? key, required this.coachName, required this.coachDescribe})
      : super(key: key);
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var heightSize = MediaQuery.of(context).size.height;
    var widthSize = MediaQuery.of(context).size.width;
    const String assetName = 'images/logo.svg';
    final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Logo');
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.blue,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              SizedBox(height: heightSize*0.02),
              SizedBox(
                child: Image.asset('images/man.png'),
                height: heightSize * 0.4,
                width: widthSize,
              ),
              SizedBox(height: heightSize*0.01),              Text(
                coachName,
                style: TextStyle(fontSize: widthSize * 0.06),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      color: colors.grey,
                    ),
                    height: heightSize * 0.41,
                    width: widthSize * 1,
                  ),
                  Padding(
                    padding: EdgeInsets.all(heightSize * 0.03),
                    child: Text(
                      coachDescribe,
                      style: TextStyle(color: colors.black),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(widthSize * 0.03),
                child: buildElevatedButton(widthSize, heightSize, context,
                    'مراسلة المدرب', colors.blue, colors.white, '/'),
              )
            ],
          )
        ],
      ),
    ));
  }

  Widget buildElevatedButton(width, hieght, BuildContext context, String label,
          var color, var labelColor, String navigation) =>
      GestureDetector(
        child: SizedBox(
            width: width * 0.5,
            height: hieght * 0.09,
            child: ElevatedButton.icon(
              icon: const Icon(Iconsax.message),
              onPressed: () => {},

              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                )),
                backgroundColor: MaterialStateProperty.all<Color>(color),
              ),
              label: Text(
                label,
                style: TextStyle(
                  color: labelColor,
                ),
              ),
            )),
      );
}
