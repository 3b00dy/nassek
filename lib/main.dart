import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nassek/Provider_classes/auth_provider.dart';
import 'package:nassek/Provider_classes/coaches_provider.dart';
import 'package:nassek/Provider_classes/daily_advice_provider.dart';
import 'package:nassek/Provider_classes/days_provider.dart';
import 'package:nassek/Provider_classes/food_provider.dart';
import 'package:nassek/screens/coaches_screen.dart';
import 'package:nassek/screens/daily_advices.dart';
import 'package:nassek/screens/diet_types.dart';
import 'package:nassek/screens/login_screen.dart';
import 'package:nassek/screens/profile_screen.dart';
import 'package:nassek/screens/search_screen.dart';
import 'package:nassek/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider_classes/add_food_provider.dart';
import 'Provider_classes/get_profile.dart';
import 'Provider_classes/types_of_diets.dart';
import 'urlClass.dart';
import 'screens/bottomNavBar.dart';
import 'screens/personal_information.dart';
import 'screens/register_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'i18n/translations_delegate.dart';

import 'package:provider/provider.dart';

const Locale arLocale = Locale('ar');
const Locale enLocale = Locale('en');

Locale? prevLocale;
String? token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences tokenValueSet = await SharedPreferences.getInstance();

  token = tokenValueSet.getString('token')??'null';

  debugPrint('token=   ${token}');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (auth) => Auth(),

        ),
        ChangeNotifierProvider(
          create: (getProfile) => GetProfile(),

        ),
        ChangeNotifierProvider(
          create: (foodProvider) => FoodProvider(),

        ),
        ChangeNotifierProvider(
          create: (addFoodProvider) => AddFoodProvider(),

        ),
        ChangeNotifierProvider(
          create: (coachesProvdier) => CoachesProvdier(),

        ),
        ChangeNotifierProvider(
          create: (dailyAdvice) => DailyAdviceProvider(),

        ),
        ChangeNotifierProvider(
          create: (getDays) => DaysProvider(''),

        ),
        ChangeNotifierProvider(
          create: (getDiteTypes) => TypesOfDiets(),

        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Locale> get supportedLocales => [
        arLocale,
        enLocale,
      ];

  getAll() async {
    await getToken();
    await context.read<FoodProvider>().foodSearching(' ');
    await context.read<DailyAdviceProvider>().fetchDailyAdvices();
    await context.read<CoachesProvdier>().fetchingCoaches();
    await context.read<GetProfile>().getProfile();
    await context.read<TypesOfDiets>().getDietTypes();
    await context.read<DaysProvider>().getDay();
  }

  @override
  void initState() {
    if (mounted) {
      getAll();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (ctc, value, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'android'),
          //
          initialRoute:token=='null'?  '/': 'navigationBar' ,
          routes: {
            '/': (context) => WelcomeScreen(),
            'login': (context) => Login(),
            'register': (context) => Register(),
            'navigationBar': (context) => const NavigationBar(),
            'profile': (context) => Profile(),
            'dietTypes': (context) => DietTypes(),
            'dailyAdvices': (context) => DailyAdvices(),
            'coachesScreen': (context) => Coaches(),
            'personalInfo': (context) => PersonalInfo(),
            'searchScreen': (context) => Search(tag: 'breakfast',
                ),
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
      },
    );
  }
}
