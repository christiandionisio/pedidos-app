import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedidos_app/pages/home_page.dart';
import 'package:pedidos_app/pages/registration_page.dart';
import 'package:pedidos_app/pages/onboarding_page.dart';
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
      initialRoute: 'home_screen',
      routes: {
        'onboarding_screen': (_) => OnboardingPage(),
        'registration_screen': (_) => RegistrationPage(),
        'home_screen': (_) => HomePage(),
      },

      // Colores y propiedades generales
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
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: PropertiesUtil.primaryColor,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
