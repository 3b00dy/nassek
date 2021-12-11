import 'package:flutter/material.dart';
import 'package:nassek/colors.dart';

class AdvicePage extends StatelessWidget {
  AdvicePage({Key? key}) : super(key: key);
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var responsiveWidth = MediaQuery.of(context).size.width;
    var responsiveHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('نصائح غذائية'),
          centerTitle: true,
          backgroundColor: colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(

            children: [
              Padding(
                padding:  EdgeInsets.only(left:responsiveWidth*0.05,right: responsiveWidth*0.05,top: responsiveHeight*0.06),
                child: Container(
                  height: responsiveHeight * 0.25,
                  width: responsiveWidth * 0.99,
                  decoration: BoxDecoration(
                      // color: colors.grey,
                      border: Border.all(
                          color: colors.grey, width: responsiveWidth * 0.004),
                      borderRadius: BorderRadius.circular(responsiveWidth * 0.08)),
                  child: Image.asset('images/logo.png'),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: responsiveWidth*0.05,top: responsiveHeight*0.05),
                    child:  Text('عنوان النصيحة ',style: TextStyle(fontSize: responsiveWidth*0.06,fontWeight: FontWeight.bold),),

                  ),

                ],
              ),
              Padding(
                padding:  EdgeInsets.only(top: responsiveHeight*0.02),
                child: Stack(
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
                          height: responsiveHeight * 0.41,
                          width: responsiveWidth * 1,
                        ),
                        Padding(
                          padding:  EdgeInsets.all(responsiveHeight*0.03),
                          child:  Text('هنا يتم عرض تفاصيل المدرب بالكامل',style: TextStyle(
                              color:colors.black

                          ),),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText(
                            'لمزيد من المعلومات www.url.com'                       )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
