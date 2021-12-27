// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nassek/Provider_classes/auth_provider.dart';
import 'package:nassek/Provider_classes/days_provider.dart';
import 'package:nassek/Provider_classes/get_profile.dart';
import 'package:nassek/colors.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({Key? key}) : super(key: key);
  AppColors colors = AppColors();
  void buildAlertDialog(Size size, BuildContext context) {
    AlertDialog alert = AlertDialog(
        title: SizedBox(
          width: size.width*0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                "هل انت متأكد من تسجيل الخروج؟",

             style: TextStyle(
               fontSize: size.width*0.044
             ), ),

            ],
          ),
        ),
        content: SizedBox(
          height: size.height * 0.08,
          child:
          Consumer<Auth>(builder: (context, auth, child) {
            return Column(
              children: [
SizedBox(
  height: size.height*0.016,
),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(size.width * 0.04),
                            )),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent),
                      ),
                      onPressed: () async {
                        auth.logout();
                        Provider.of<DaysProvider>(context,listen: false).refresh=true;
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/', (Route<dynamic> route) => false);

                      },
                      child: const Text(
                        'تأكيد',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(size.width * 0.04),
                            )),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(colors.deepGrey),
                      ),
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text(
                        'الغاء',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
        ));



    showDialog(context: context, builder: (_) => alert);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions:[ IconButton(onPressed:(){
          buildAlertDialog(size, context);


        } ,icon: Icon(Iconsax.logout),),
        ],elevation: 0,
        backgroundColor: colors.blue,
        title: const Text('المعلومات الشخصية'),
        centerTitle: true,
      ),
      body: Consumer<GetProfile>(
        builder: (context,value,_) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(size.height * 0.03),
              child: Column(
                children: [
                  Center(
                    child:
              Image.asset(
              Provider.of<GetProfile>(context).profile.gender=='Male'?
              'images/man.png':'images/women.png',
              width: size.width * 0.2,
              height: size.height * 0.2,
            ),
                  ),
                  buildPersonalListTile('الأسم الأول','${value.profile.firstName}'),
                  buildPersonalListTile(' الأسم الأخير','${value.profile.lastName}'),
                  buildPersonalListTile('البريد الألكتروني','${value.profile.email}'),
                  buildPersonalListTile('كلمة المرور','*******'),
                  buildPersonalListTile('تأريخ الميلاد','${value.profile.birthdate}'),
                  buildPersonalListTile('الوزن','${value.profile.weight}'),
                  buildPersonalListTile('الطول','${value.profile.height}'),
                  buildPersonalListTile('الأمراض المزمنة','${value.profile.chronicDiseases}'),
                  buildPersonalListTile('الجنس','${value.profile.gender}'),
                ],
              ),
            ),
          );
        }
      ),
    ));
  }

  Widget buildPersonalListTile(name,info) {
    return Column(
      children: [
        ListTile(
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            info,
            style: TextStyle(color: colors.hint),
          ),
        ),
        const Divider(
          thickness: 1.5,
        ),
      ],
    );
  }
}
