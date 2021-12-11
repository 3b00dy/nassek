// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nassek/colors.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({Key? key}) : super(key: key);
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: colors.blue,
        title: const Text('المعلومات الشخصية'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size * 0.03),
          child: Column(
            children: [
              Center(
                child: Image.network(
                  'https://www.seekpng.com/png/small/428-4287240_no-avatar-user-circle-icon-png.png',
                  width: sizeWidth * 0.2,
                  height: size * 0.2,
                ),
              ),
              buildPersonalListTile('الأسم الأول','Selena'),
              buildPersonalListTile(' الأسم الأخير','Gomez'),
              buildPersonalListTile('البريد الألكتروني','selena@example.com'),
              buildPersonalListTile('كلمة المرور','*******'),
              buildPersonalListTile('تأريخ الميلاد','22/7/1992'),
              buildPersonalListTile('الوزن','54'),
              buildPersonalListTile('الطول','165'),
              buildPersonalListTile('الأمراض المزمنة','لا يوجد'),
              buildPersonalListTile('الجنس','انثى'),
            ],
          ),
        ),
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
