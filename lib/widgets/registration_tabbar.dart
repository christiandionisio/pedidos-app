import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class RegistrationTabController extends StatelessWidget {
  const RegistrationTabController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                  Text("Home Body"),
                ],
              ),
              Container(
                child: Text("Login Body"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
