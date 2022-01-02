import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:date_field/date_field.dart';

import 'package:nassek/Provider_classes/auth_provider.dart';
import 'package:nassek/api_models/loading_State.dart';
import 'package:nassek/colors.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  Map<String, dynamic> authValues = {
    'first_name': '',
    'last_name': '',
    'email': '',
    'password': '',
    'birthdate': '',
    'weight': '',
    'height': '',
    'chronic_diseases': '',
    'gender': '',
  };

  Register({Key? key}) : super(key: key);
  AppColors colors = AppColors();
  List<String> gender = ['ذكر', 'انثى'];
  LoadingState loadingState = LoadingState.idle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery
                .of(context)
                .size
                .height * 0.028),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.01,
                ),
                Text(
                  'التسجيل ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery
                          .of(context)
                          .size
                          .height * 0.032),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.015,
                ),
                const Text('يرجى ادخال البيانات بشكل دقيق'),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.035,
                ),
                buildTextFieldForm(context, 'الأسم الأول', TextInputType.text,
                    'first_name', Icon(Iconsax.personalcard)),
                buildTextFieldForm(context, 'الأسم الأخير', TextInputType.text,
                    'last_name', Icon(Iconsax.personalcard)),
                buildTextFieldForm(context, 'البريد الألكتروني',
                    TextInputType.emailAddress, 'email', Icon(Iconsax.sms)),


                buildPasswordFieldForm(context, 'كلمة المرور',
                    TextInputType.visiblePassword, 'password'),

                Column(
                  children: [
                    DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Iconsax.calendar),
                        labelText: 'تأريخ الميلاد',
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                      onDateSelected: (DateTime value) {
                        value.toIso8601String().split('T')[0];
                        authValues['birthdate']=value.toIso8601String().split('T')[0];
                        print(value.toIso8601String().split('T')[0]);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02,
                    ),
                  ],
                ),


                // buildTextFieldForm(
                //     context,
                //     'تأريخ الميلاد',
                //     TextInputType.datetime,
                //     'birthdate',
                //     Icon(Iconsax.calendar)),
                buildTextFieldForm(context, 'الوزن', TextInputType.number,
                    'weight', Icon(Iconsax.weight)),
                buildTextFieldForm(context, 'الطول', TextInputType.number,
                    'height', Icon(Icons.height)),
                buildTextFieldForm(context, 'الأمراض المزمنة',
                    TextInputType.text, 'chronic_diseases',
                    const Icon(Iconsax.bill)),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: colors.grey)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery
                                .of(context)
                                .size
                                .height * 0.04,
                            left: MediaQuery
                                .of(context)
                                .size
                                .height * 0.03),
                        child: Text(
                          'الجنس |',
                          style: TextStyle(
                              color: colors.hint,
                              fontSize:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.025),
                        ),
                      ),
                      Expanded(child: customRadio(context)),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لديك حساب؟',
                      style: TextStyle(
                        fontSize: MediaQuery
                            .of(context)
                            .size
                            .height * 0.022,
                      ),
                    ),
                    TextButton(
                        onPressed: () =>
                        {Navigator.pushReplacementNamed(context, 'login')},
                        child: Text('تسجيل الدخول',
                            style: TextStyle(
                              fontSize:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.022,
                            )))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.05,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.4,
                      child: Consumer<Auth>(builder: (context, provider, _) {
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(colors.blue),
                          ),
                          onPressed: () async {
                         await    provider.signUp(authValues);
                            // buildAlertDialog(context);
                            if (loadingState == LoadingState.loading) {
                              buildAlertDialog(context);
                            }
                            else if (provider.statusCode != 201) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text('يرجى ادخال معلومات صحيحة')));


                            } else if (provider.statusCode == 201) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  'navigationBar',
                                      (Route<dynamic> route) => false);
                            }
                          },
                          child: Text(
                            'تسجيل',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.02,
                            ),
                          ),
                        );
                      }),
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

  Column buildTextFieldForm(context, String inputName, TextInputType type,
      valueName, icon) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) {
            authValues[valueName] = value;
          },
          keyboardType: type,
          decoration: InputDecoration(
            suffixIcon: icon,
            label: Text(inputName),
            hintText: valueName == 'birthdate' ? '2000-12-15' : '',
            fillColor: colors.black,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.indicatorCyan, width: 0.5),
                borderRadius: BorderRadius.circular(5)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.02,
        ),
      ],
    );
  }

  Widget buildPasswordFieldForm(context, String inputName, TextInputType type,
      valueName) {
    return Consumer<Auth>(
      builder: (context, provider, child) {
        return Column(
          children: [
            TextFormField(
              onChanged: (value) {
                authValues[valueName] = value;
              },
              // keyboardType: type,
              obscureText: provider.isObscure,
              decoration: InputDecoration(
                suffixIcon: const Icon(Iconsax.key),
                label: Text(inputName),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: colors.indicatorCyan, width: 0.5),
                    borderRadius: BorderRadius.circular(5)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
            ),
          ],
        );
      },
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
        buttonValues: const ["Male", "Female"],
        buttonTextStyle: ButtonTextStyle(
            selectedColor: Colors.white,
            unSelectedColor: colors.black,
            textStyle: TextStyle(
              fontSize: MediaQuery
                  .of(ctx)
                  .size
                  .height * 0.022,
            )),
        radioButtonValue: (value) {
          authValues['gender'] = value;
        },
        selectedColor: colors.blue);
  }
}

void buildAlertDialog(BuildContext context) {
  Future.delayed(const Duration(seconds: 5));
  const Center(
      child: CircularProgressIndicator());
}