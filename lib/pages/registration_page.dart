import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';
import 'package:pedidos_app/widgets/modal_registration.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: Column(
          children: [
            // Registration image
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 130.0),
              child: Center(
                child: Image(
                    image: AssetImage('assets/registration/order_success.png')),
              ),
            ),

            // Welcome Text
            const Center(
              child: Text(
                'Welcome',
                style: PropertiesUtil.titleStyle,
              ),
            ),

            // Body Text
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Center(
                child: Text(
                  'Before enjoying Foodmedia services \nPlease register first',
                  style: TextStyle(
                    fontSize: 14.4,
                    color: PropertiesUtil.onboardingTextBodyColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(height: 30.0),

            // Registsration Button
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) {
                        return CustomModalRegistration(initialIndex: 0);
                      },
                    );
                  },
                  style: PropertiesUtil.stylePrimaryButton,
                  child: const Text("Create Account"),
                ),
              ),
            ),

            SizedBox(height: 15),

            // Login Button
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 49,
                child: OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) {
                        return CustomModalRegistration(initialIndex: 1);
                      },
                    );
                  },
                  style: PropertiesUtil.stylePrimaryButton,
                  child: const Text("Login"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
