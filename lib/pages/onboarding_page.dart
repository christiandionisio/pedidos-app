import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pedidos_app/pages/registration_page.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class OnboardingPage extends StatelessWidget {
  PageViewModel customPageViewModel(
      String titulo, String body, String imageUrl) {
    return PageViewModel(
      title: titulo,
      body: body,
      image: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image(image: AssetImage(imageUrl)),
        ],
      ),
      decoration: const PageDecoration(
        titleTextStyle: PropertiesUtil.titleStyle,
        bodyTextStyle: TextStyle(
            fontSize: 12.0, color: PropertiesUtil.onboardingTextBodyColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // Lista de páginas
      pages: [
        customPageViewModel(
            'Nearby restaurants',
            'You don\'t have to go far to find a good restaurant, we have provided all the restaurants that is near you',
            'assets/onboarding/1-tracking_maps.png'),
        customPageViewModel(
            'Select the Favorites Menu',
            'Now eat well, don\'t leave the house,You can choose your favorite food only with one click',
            'assets/onboarding/2-order_illustration.png'),
        customPageViewModel(
            'Good food at a cheap price',
            'You can eat at expensive restaurants with affordable price',
            'assets/onboarding/3-safe_food.png'),
      ],
      onDone: () {
        // When done button is press
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegistrationPage(),
            ));
      },
      showSkipButton: true,
      skip: const Text("Skip"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w900)),
      showNextButton: false,

      // Set colors
      color: PropertiesUtil.primaryColor,
      nextColor: PropertiesUtil.primaryColor,
      dotsDecorator: DotsDecorator(
        color: PropertiesUtil.dotsColor,
        activeColor: PropertiesUtil.primaryColor,
      ),
    );
  }
}
