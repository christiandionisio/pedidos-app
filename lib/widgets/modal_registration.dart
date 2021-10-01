import 'package:flutter/material.dart';
import 'package:pedidos_app/widgets/registration_tabbar.dart';

class CustomModalRegistration extends StatelessWidget {
  const CustomModalRegistration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 578,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: RegistrationTabController(),
          ),
        ),
      ),
    );
  }
}
