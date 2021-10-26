import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class DirectionCard extends StatelessWidget {
  const DirectionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PropertiesUtil.getCardDecoration,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.all(5),
      height: 130,
      child: ListTile(
        leading: Icon(
          Icons.home_work_outlined,
          size: 80,
          color: Colors.lightBlue[200],
        ),
        title: const Text(
          'Sector 1 Grupo 13 Mz L Lt: 20',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: false,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              SizedBox(height: 2),
              SizedBox(
                width: 160,
                child: const Text(
                  'VILLA EL SALVADOR, LIMA, LIMA',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 160,
                child: const Text(
                  'Christian Dionisio Triveño',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(
                width: 160,
                child: const Text(
                  'Teléfono: 999 999 999',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        trailing: Container(
          child: IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () {
              // TODO: ir a editar usuario
              Navigator.pushNamed(context, 'direccion_settings_screen');
            },
          ),
        ),
      ),
    );
  }
}
