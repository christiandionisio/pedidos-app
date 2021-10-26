import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 111,
      child: ElevatedButton(
        child: Text("Logout"),
        onPressed: () {
          // TODO: LOGOUT
        },
        style: PropertiesUtil.styleDangerButton,
      ),
    );
  }
}
