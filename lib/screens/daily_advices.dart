// ignore_for_file: must_be_immutable


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:nassek/Provider_classes/daily_advice_provider.dart';
import 'package:nassek/colors.dart';
import 'package:nassek/urlClass.dart';
import 'package:provider/provider.dart';
import 'advice_screen.dart';

class DailyAdvices extends StatelessWidget {
  DailyAdvices({Key? key}) : super(key: key);

  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    Widget loader(){
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEBEBF4),
              Color(0xFFF4F4F4),
              Color(0xFFEBEBF4),
            ],
            stops: [
              0.1,
              0.3,
              0.4,
            ],
            begin: Alignment(-1.0, -0.3),
            end: Alignment(1.0, 0.3),
            tileMode: TileMode.clamp,
          )
        ),
      );
    };
    // List<DailyAdvicesModle> _daily=Provider.of<DailyAdviceProvider>(context).dailyAdviceModel;
// late Future;<DailyAdvicesModle>;
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body: Consumer<DailyAdviceProvider>(
        builder: (context,dailyAdvice,_) {
          return RefreshIndicator(
            onRefresh: (){
                return Future.delayed(const Duration(seconds: 1), () {
                  dailyAdvice.fetchDailyAdvices();
            });},
            child: ListView.builder(
                  itemCount: dailyAdvice.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(responsiveHeight * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: colors.grey,
                            border: Border.all(
                                color: colors.grey, width: responsiveWidth * 0.004),
                            borderRadius: BorderRadius.circular(responsiveWidth * 0.06)),
                        height: responsiveHeight * 0.18,
                        width: responsiveWidth * 0.8,
                        child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AdvicePage(
                                        title: dailyAdvice.dailyAdviceModel[index].title,
                                        description: dailyAdvice.dailyAdviceModel[index].description,
                                        url: dailyAdvice.dailyAdviceModel[index].url,
                                        img: '$baseUrl${dailyAdvice.dailyAdviceModel[index].image}',
                                      )));
                            },
                            title: Text(dailyAdvice.dailyAdviceModel[index].title),
                            subtitle: Text(dailyAdvice.dailyAdviceModel[index].description,
                                maxLines: 3, overflow: TextOverflow.ellipsis),
                            leading: SizedBox(
                              height: responsiveHeight*0.2,
                              width: responsiveWidth*0.2,
                              child:
                    // CircleAvatar(
                    //             backgroundColor: Colors.transparent,
                    //             backgroundImage:

                                CachedNetworkImage(
                                  imageUrl: "$baseUrl${dailyAdvice.dailyAdviceModel[index].image}",
                                  placeholder: (context, url) => loader(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                      // NetworkImage(
                      //   '$baseUrl${dailyAdvice.dailyAdviceModel[index].image}',
                      //
                      // ),
                      // ),
                    )),
                      ),
                    );
                  },
                ),
          );
        }
      )


    ));
  }

  // ListView buildListView(DailyAdviceProvider view, double responsiveHeight, double responsiveWidth) {
  //   return ListView.builder(
  //       itemCount: view.dailyAdviceModel.length,
  //       itemBuilder: (context, index) {
  //         return Padding(
  //           padding: EdgeInsets.all(responsiveHeight * 0.02),
  //           child: Container(
  //             decoration: BoxDecoration(
  //                 // color: colors.grey,
  //                 border: Border.all(
  //                     color: colors.grey, width: responsiveWidth * 0.004),
  //                 borderRadius: BorderRadius.circular(responsiveWidth * 0.1)),
  //             height: responsiveHeight * 0.18,
  //             width: responsiveWidth * 0.8,
  //             child: ListTile(
  //                 onTap: () {
  //                   Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (_) => AdvicePage(
  //                                 title: view.dailyAdviceModel[index].title,
  //                                 description: view
  //                                     .dailyAdviceModel[index].description,
  //                                 url: view.dailyAdviceModel[index].url,
  //                                 img: view.dailyAdviceModel[index].image,
  //                               )));
  //                 },
  //                 title: Text(view.dailyAdviceModel[index].title),
  //                 subtitle: Text(view.dailyAdviceModel[index].description,
  //                     maxLines: 3, overflow: TextOverflow.ellipsis),
  //                 leading: CircleAvatar(
  //                   backgroundColor: Colors.transparent,
  //                   backgroundImage: NetworkImage(
  //                     view.dailyAdviceModel[index].image,
  //                   ),
  //                 )),
  //           ),
  //         );
  //       },
  //     );
  // }
}


/*
*
*    LoadingState loadingState = LoadingState.idle;

    late List<DailyAdvicesModle> dailyAdviceModel;

    Future<List<DailyAdvicesModle>> fetchDailyAdvices() async {
      http.Response response;
      try {
        var url = Uri.parse('http://10.0.2.2:8000/api/daily_advice');

        response = await http.get(url);

        var jsonModels = json.decode(response.body);

        debugPrint('Api Response== $jsonModels');
        loadingState=LoadingState.loading;

        List<DailyAdvicesModle> models = jsonModels.map<DailyAdvicesModle>(
                (_modelJson) => DailyAdvicesModle.fromJson(_modelJson))
            .toList();
        dailyAdviceModel=models;

        debugPrint('داشوف ديشتغله لو لا');
        debugPrint('dailyAdvicesModel......${dailyAdviceModel[0].title}');
        debugPrint('dailyAdvicesModel......${dailyAdviceModel[0].image}');
        debugPrint('dailyAdvicesModel......${dailyAdviceModel[0].description}');
        debugPrint('dailyAdvicesModel......${dailyAdviceModel[0].url}');
        debugPrint('dailyAdvicesModel......$dailyAdviceModel');
        debugPrint('Model......${models[0].title}');
        loadingState=LoadingState.finished;
        // notifyListeners();

        return models;


      } catch (error) {
        rethrow;
      }
      // notifyListeners();
    }
* */
