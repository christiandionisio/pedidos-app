import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class AccountSettingsCard extends StatelessWidget {
  const AccountSettingsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PropertiesUtil.getCardDecoration,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.all(5),
      height: 80,
      child: ListTile(
        leading: Icon(
          Icons.account_circle_outlined,
          size: 35,
          color: Color(0xFF374151),
        ),
        title: const Text(
          'Account Settings',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF374151),
          ),
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(300)),
          child: Container(
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // TODO: ir a editar usuario
                print('Editar usuario');
              },
            ),
          ),
        ),
      ),
    );
  }
}
