import 'package:flutter/material.dart';
import 'package:pedidos_app/providers/login_form_provider.dart';
import 'package:pedidos_app/providers/registration_form_provider.dart';
import 'package:pedidos_app/utils/properties_util.dart';
import 'package:pedidos_app/widgets/login_form.dart';
import 'package:pedidos_app/widgets/registration_form.dart';
import 'package:provider/provider.dart';

class RegistrationTabController extends StatelessWidget {
  final int initialIndex;

  const RegistrationTabController({Key? key, required this.initialIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: this.initialIndex,
      child: Column(
        children: [
          const Divider(
            height: 20,
            thickness: 5,
            indent: 170,
            endIndent: 170,
          ),
          Container(
            child: const TabBar(
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2.5,
                    color: PropertiesUtil.primaryColor,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 60)),
              labelColor: PropertiesUtil.primaryColor,
              unselectedLabelColor: PropertiesUtil.unselectedTabText,
              tabs: [
                Tab(text: "Create Account"),
                Tab(text: "Login"),
              ],
            ),
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              Column(
                children: [
                  SizedBox(height: 30),
                  ChangeNotifierProvider(
                    create: (_) => RegistrationFormProvider(),
                    child: RegistrationForm(),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 30),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: LoginForm(),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
