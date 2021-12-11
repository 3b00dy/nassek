import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String assetName = 'images/logo.svg';
    final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Logo');

    return Scaffold(body: Center(child: svg,),);
  }
}
