import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedidos_app/pages/account_settings_page.dart';
import 'package:pedidos_app/pages/direccion_settings_page.dart';
import 'package:pedidos_app/pages/dish_page.dart';
import 'package:pedidos_app/pages/principal_page.dart';
import 'package:pedidos_app/pages/registration_page.dart';
import 'package:pedidos_app/pages/onboarding_page.dart';
import 'package:pedidos_app/providers/creditcard_form.dart';
import 'package:pedidos_app/providers/direccion_form_provider.dart';
import 'package:pedidos_app/providers/perfil_form_provider.dart';
import 'package:pedidos_app/utils/properties_util.dart';
import 'package:pedidos_app/widgets/profile_page/add_credit_card_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new PerfilFormProvider()),
        ChangeNotifierProvider(create: (_) => new DireccionFormProvider()),
        ChangeNotifierProvider(create: (_) => new CreditCardFormProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pedidos App',
        initialRoute: 'onboarding_screen',
        routes: {
          'onboarding_screen': (_) => OnboardingPage(),
          'registration_screen': (_) => RegistrationPage(),
          'home_screen': (_) => PrincipalPage(),
          'dish_screen': (_) => DishPage(),
          'account_settings_screen': (_) => AccountSettingsPage(),
          'direccion_settings_screen': (_) => DireccionSettingsPage(),
          'add_credit_card_screen': (_) => CreditCardScreen(),
        },

        // Colores y propiedades generales
        theme: ThemeData(
          primaryColor: PropertiesUtil.primaryColor,
          primaryColorLight: PropertiesUtil.primaryColor,
          appBarTheme: const AppBarTheme(
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
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: PropertiesUtil.primaryColor,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
