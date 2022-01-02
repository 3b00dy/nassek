// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nassek/colors.dart';
import 'package:link_text/link_text.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvicePage extends StatelessWidget {
  String img,title,description,url;
  AdvicePage({Key? key,required this.title,required this.description,required this.img,required this.url}) : super(key: key);
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    // void _launchURL() async {
    //   if (await launch(url)) throw 'Could not launch $url';
    // }
    var responsiveWidth = MediaQuery.of(context).size.width;
    var responsiveHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('نصائح غذائية'),
          centerTitle: true,
          backgroundColor: colors.blue,
        ),
        body: Stack(
        alignment: Alignment.bottomCenter,
          children: [
            Column(

              children: [
                Padding(
                  padding:  EdgeInsets.only(left:responsiveWidth*0.05,right: responsiveWidth*0.05,top: responsiveHeight*0.06),
                  child: Container(
                    height: responsiveHeight * 0.25,
                    width: responsiveWidth * 0.99,

                    child: CachedNetworkImage(
                      imageUrl: img,fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),



                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: responsiveWidth*0.05,top: responsiveHeight*0.05),
                      child:  Text(title,style: TextStyle(fontSize: responsiveWidth*0.06,fontWeight: FontWeight.bold),),

                    ),

                  ],
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
                        child:  Text(description,style: TextStyle(
                            color:colors.black

                        ),),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('لمزيد من المعلومات  '),
                          TextButton(
                           child:  const Text('اضغط هنا'),
                            onPressed:()async{
                             await launch(url);
                            } ,




                          ),
                          // SelectableText(
                          //     url                       ),
                        ],
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );

  }
}
