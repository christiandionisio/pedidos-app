import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class ProrfileCard extends StatelessWidget {
  const ProrfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PropertiesUtil.getCardDecoration,
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.all(5),
      height: 80,
      child: ListTile(
        leading: const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(300)),
          child: Image(
            image: AssetImage('assets/home/perfil.png'),
            width: 44,
            height: 44,
            fit: BoxFit.cover,
          ),
        ),
        title: const Text(
          'Sadek Hossen',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              SizedBox(
                width: 150,
                child: const Text(
                  'sadekbranding@gmail.com',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(300)),
          child: Container(
            color: Color(0xFFF9F9F9),
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // TODO: enviar parametros de usuario
                Navigator.pushNamed(context, 'account_settings_screen');
              },
            ),
          ),
        ),
      ),
    );
  }
}
