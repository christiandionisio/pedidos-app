import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class SectionTitleLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitleLabel(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          this.title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(this.subtitle, style: TextStyle(fontSize: 13)),
        trailing: GestureDetector(
          onTap: () {
            //TODO: redireccionar a página de sección
            print('TAPPPP!!!');
            print('hola');
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('See All',
                  style: TextStyle(color: PropertiesUtil.listTileTrailing)),
              Icon(Icons.chevron_right, color: PropertiesUtil.listTileTrailing),
            ],
          ),
        ),
      ),
    );
  }
}
