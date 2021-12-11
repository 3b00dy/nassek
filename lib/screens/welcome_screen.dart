import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nassek/colors.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var heightSize = MediaQuery.of(context).size.height;
    var widthSize = MediaQuery.of(context).size.width;
    const String assetName = 'images/logo.svg';
    final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Logo');

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: svg,
            height: heightSize * 0.5,
            width: widthSize,
          ),
          Padding(
            padding: EdgeInsets.all(heightSize * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: heightSize * 0.02),
                  child: Text(
                    'تطبيق نسق',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: widthSize * 0.07),
                  ),
                ),
                Text(
                  'هو تطبيق لنصائح التغذية يساعدك على اتباع حمية غذائية ونظام غذائي صحي ومعرفة السعرات الحرارية التي تم اكلها ',
                  style: TextStyle(
                       fontSize: widthSize * 0.046),
                ),
              ],
            ),
          ),
          SizedBox(height: heightSize*0.02,),
          buildElevatedButton(widthSize,heightSize,
              context, 'تسجيل الدخول', colors.blue, colors.white, 'login'),
          buildElevatedButton(widthSize,heightSize,
              context, 'تسجيل', colors.grey, colors.black, 'register'),
        ],
      ),
    );
  }

  Widget buildElevatedButton(width,hieght,BuildContext context, String label, var color,
          var labelColor, String navigation) =>
      GestureDetector(
        child: SizedBox(
            width: width*0.42,

            child: ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, navigation)},
              child: Text(
                label,
                style: TextStyle(color: labelColor,fontSize: hieght*0.023),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                )),
                backgroundColor: MaterialStateProperty.all<Color>(color),
              ),
            )),
      );
}
