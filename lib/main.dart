import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedidos_app/pages/home_page.dart';
import 'package:pedidos_app/pages/onboarding.dart';
import 'package:pedidos_app/utils/properties_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedidos App',
      initialRoute: 'onboarding_screen',
      routes: {
        'onboarding_screen': (_) => OnboardingPage(),
        'home_screen': (_) => HomePage(),
      },
      theme: ThemeData(
          primaryColor: PropertiesUtil.primaryColor,
          primaryColorLight: PropertiesUtil.primaryColor,
          appBarTheme: AppBarTheme(
            color: PropertiesUtil.primaryColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: PropertiesUtil.primaryColor,
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                primary: PropertiesUtil.primaryColor,
                backgroundColor: PropertiesUtil.primaryColorOutlined),
          )),
    );
  }
}
