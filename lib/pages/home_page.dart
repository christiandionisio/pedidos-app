import 'package:flutter/material.dart';
import 'package:pedidos_app/ui/input_decorations.dart';
import 'package:pedidos_app/utils/properties_util.dart';
import 'package:pedidos_app/widgets/bottom_menu.dart';
import 'package:pedidos_app/widgets/home_page/custom_dish_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: _getCustomAppBar(),
      body: Column(
        children: [
          _SearchCustomWidget(),

          // Section title lable
          _SectionTitleLabel(
            title: 'Today New Arivable',
            subtitle: 'Best of the today  food list update',
          ),
          // Lista de platos
          _CustomListDishes(),
        ],
      ),
      bottomNavigationBar: BottomPrincipalMenu(),
    );
  }

  AppBar _getCustomAppBar() {
    return AppBar(
      title: Text('App Pedidos'),
      leading: IconButton(
        // TODO: desplegar menú lateral
        onPressed: () {},
        icon: Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          // TODO: actualizar perfil de acuerdo a servicio
          icon: Image.asset('assets/home/perfil.png'),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _CustomListDishes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomDishCard();
        },
      ),
    );
  }
}

class _SectionTitleLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitleLabel(
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
            children: [
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

class _SearchCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: TextField(
        decoration: InputDecorations.searchHomeInputDecoration(
            hintText: 'Search', labelText: '', prefixIcon: Icons.search),
        onTap: () {
          print('Go to Search Page!');
        },
      ),
    );
  }
}
