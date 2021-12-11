import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nassek/colors.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:nassek/providers.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  AppColors colors = AppColors();
  List<String> gender = ['ذكر', 'انثى'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.white,
        // appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.028),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'التسجيل ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.032),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                const Text('يرجى ادخال البيانات بشكل دقيق'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                buildTextFieldForm(context, 'الأسم الأول', TextInputType.text),
                buildTextFieldForm(context, 'الأسم الأخير', TextInputType.text),
                buildTextFieldForm(
                    context, 'البريد الألكتروني', TextInputType.emailAddress),
                buildPasswordFieldForm(
                    context, 'كلمة المرور', TextInputType.visiblePassword),
                buildTextFieldForm(
                    context, 'تأريخ الميلاد', TextInputType.datetime),
                buildTextFieldForm(context, 'الوزن', TextInputType.number),
                buildTextFieldForm(context, 'الطول', TextInputType.number),
                buildTextFieldForm(
                    context, 'الأمراض المزمنة', TextInputType.text),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: colors.grey)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.height * 0.04,
                            left: MediaQuery.of(context).size.height * 0.03),
                        child: Text(
                          'الجنس |',
                          style: TextStyle(color: colors.hint, fontSize: MediaQuery.of(context).size.height * 0.025),
                        ),
                      ),
                      Expanded(child: customRadio(context)),
                    ],
                  ),
                ),
                // buildTextFieldForm('الجنس', TextInputType.number),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text('لديك حساب؟',style: TextStyle(   fontSize: MediaQuery.of(context).size.height * 0.022,),),
                    TextButton(
                        onPressed: () =>
                            {Navigator.pushReplacementNamed(context, 'login')},
                        child:  Text('تسجيل الدخول',style: TextStyle(   fontSize: MediaQuery.of(context).size.height * 0.022,)))
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(colors.blue),
                        ),
                        onPressed: () => {},
                        child:  Text(
                          'تسجيل',
                          style: TextStyle(fontWeight: FontWeight.bold,  fontSize: MediaQuery.of(context).size.height * 0.02,),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildTextFieldForm(context, String inputName, TextInputType type) {
    return Column(
      children: [
        TextField(
          // maxLines: 5,

          keyboardType: type,
          decoration: InputDecoration(
            label: Text(inputName),

            // hintText: inputName,
            // hintStyle: TextStyle(
            //   color: colors.hint,
            //   fontSize: MediaQuery.of(context).size.height * 0.02,
            // ),
            fillColor: colors.black,
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: colors.indicatorCyan, width: 0.5),
                borderRadius: BorderRadius.circular(5)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(15)),


          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }

  Column buildPasswordFieldForm(context, String inputName, TextInputType type) {
    return Column(
      children: [
        TextField(
          keyboardType: type,
          obscureText: true,
          decoration: InputDecoration(
            label:Text(inputName) ,
            focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: colors.indicatorCyan, width: 0.5),
                borderRadius: BorderRadius.circular(5)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(15)),



          ),
        ),
         SizedBox(
          height:MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }

  Widget customRadio(ctx) {
    return CustomRadioButton(
        enableShape: true,
        margin: const EdgeInsets.only(left: 5, right: 5),
        padding: 10,

        radius: 8,
        unSelectedBorderColor: colors.grey,
        selectedBorderColor: colors.white,
        elevation: 0,
        absoluteZeroSpacing: true,
        unSelectedColor: colors.white,
        buttonLables: const [
          'ذكر',
          'انثى',
        ],
        buttonValues: const ["MALE", "FEMALE"],
        buttonTextStyle: ButtonTextStyle(
            selectedColor: Colors.white,
            unSelectedColor: colors.black,
            textStyle:  TextStyle(  fontSize: MediaQuery.of(ctx).size.height * 0.022,)),
        radioButtonValue: (value) {
          Provider.of<Changing>(ctx, listen: false).setGender(value);
        },
        selectedColor: colors.blue);
  }
}
