// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nassek/Provider_classes/coaches_provider.dart';
import 'package:nassek/api_models/loading_State.dart';
import 'package:nassek/colors.dart';
import 'package:nassek/screens/coach_details.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

class Coaches extends StatelessWidget {
  Coaches({Key? key}) : super(key: key);

  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    var responsiveWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('قائمة المدربين'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: colors.blue,
            ),
            body: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 1), () {

                  Provider.of<CoachesProvdier>(context,listen: false).fetchingCoaches();

                });
              },
              child: Consumer<CoachesProvdier>(
                builder: (context,coaches,_) {
                  if( coaches.loadingState==LoadingState.idle){
    return  Center(child: Container(),);
    }else if(coaches.loadingState==LoadingState.loading)
      {
        return const Center(child: CircularProgressIndicator(),);
      }
                  else {
                          return ListView.builder(
                              itemCount: coaches.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: responsiveHeight * 0.003,
                                    ),
                                    buildCoachesPadding(
                                        context,
                                        responsiveHeight,
                                        responsiveWidth,
                                        coaches.coachesModel![index].name,
                                        coaches.coachesModel![index].description),
                                  ],
                                );
                              });
                        }
                      })

              ),
            ));
  }

  Padding buildCoachesPadding(context, double responsiveHeight,
      double responsiveWidth, coachName, coachDescribe) {
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
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: CoachDetails(
                        coachName: coachName, coachDescribe: coachDescribe)));
            // Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CoachDetails(coachName:coachName,coachDescribe: coachDescribe)));
          },
          title: Text(coachName),
          subtitle: Text(coachDescribe),
          trailing: CircleAvatar(
            backgroundColor: colors.grey,
            backgroundImage: const AssetImage('images/man.png'),
            child: SizedBox(
              height: responsiveHeight * 0.3,
              width: responsiveWidth * 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
