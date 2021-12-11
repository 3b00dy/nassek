import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nassek/providers.dart';
import 'package:nassek/screens/advice_screen.dart';
import 'package:nassek/screens/coach_details.dart';
import 'package:nassek/screens/coaches_screen.dart';
import 'package:nassek/screens/daily_advices.dart';
import 'package:nassek/screens/diet_types.dart';
import 'package:nassek/screens/login_screen.dart';
import 'package:nassek/screens/profile_screen.dart';
import 'package:nassek/screens/search_screen.dart';
import 'package:nassek/screens/splash_screen.dart';
import 'package:nassek/screens/welcome_screen.dart';

import 'screens/bottomNavBar.dart';
import 'screens/personal_information.dart';
import 'screens/register_screen.dart';
import 'i18n/translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'i18n/translations_delegate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

const Locale arLocale = Locale('ar');
const Locale enLocale = Locale('en');

Locale? prevLocale;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Changing()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  List<Locale> get supportedLocales => [
        arLocale,
        enLocale,
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'android' ),


      initialRoute: 'navigationBar',
      routes: {
        '/': (context) => WelcomeScreen(),
        'login': (context) => Login(),
        'register':(context)=>Register(),
        'navigationBar':(context)=>const NavigationBar(),
        'profile':(context)=>  Profile(),
        'dietTypes':(context)=>  DietTypes(),
        'dailyAdvices':(context)=>  DailyAdvices(),
        'coachesScreen':(context)=>  Coaches(),
        'personalInfo':(context)=>  PersonalInfo(),
        'coachDetails':(context)=>  CoachDetails(),
        'adviceScreen':(context)=>  AdvicePage(),
        'searchScreen':(context)=>  Search(),
        'splashScreen':(context)=>  const Splash(),



      },
      localizationsDelegates: const [
        AlphaStoreLocalizationDelegate(),
        TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      locale: arLocale,
    );
  }
}
//orientation
/*
*
* 	<string>UIInterfaceOrientationLandscapeLeft</string>
        		<string>UIInterfaceOrientationLandscapeRight</string>


* */