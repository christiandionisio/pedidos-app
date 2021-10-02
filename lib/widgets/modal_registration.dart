import 'package:flutter/material.dart';
import 'package:pedidos_app/widgets/registration_tabbar.dart';

class CustomModalRegistration extends StatelessWidget {
  final initialIndex;

  const CustomModalRegistration({Key? key, required this.initialIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 576,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: RegistrationTabController(initialIndex: this.initialIndex),
          ),
        ),
      ),
    );
  }
}
