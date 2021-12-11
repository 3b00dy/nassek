import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nassek/colors.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  var colors = AppColors();

  @override
  Widget build(BuildContext context) {
    const String assetName = 'images/logo.svg';
    final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Logo');
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: svg,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                buildTextFieldForm(context,
                    'البريد الألكتروني', TextInputType.emailAddress, false),
                buildTextFieldForm(context,
                    'كلمة المرور', TextInputType.visiblePassword, true),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ليس لديك حساب؟',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.022),
                    ),
                    TextButton(
                        onPressed: () =>
                            {Navigator.pushReplacementNamed(context, '/')},
                        child: Text(
                          'تسجيل',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.height * 0.26,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(colors.blue),
                        ),
                        onPressed: () => {},
                        child: const Text(
                          'تسجيل الدخول',
                          style: TextStyle(fontWeight: FontWeight.bold),
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

  Column buildTextFieldForm(context,
      String inputName, TextInputType type, bool passOrNot) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.08,
          width: MediaQuery.of(context).size.width*0.90,
          child: TextField(
            keyboardType: type,
            obscureText: passOrNot,
            decoration: InputDecoration(
              hintText: inputName,
              hintStyle:  TextStyle(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.width *0.04),
              fillColor: colors.white,
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colors.indicatorCyan, width:MediaQuery.of(context).size.width *0.002),
                  borderRadius: BorderRadius.circular(5)),
              enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.grey, width: MediaQuery.of(context).size.width *0.002),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
         SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
      ],
    );
  }
}
