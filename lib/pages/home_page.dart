import 'package:flutter/material.dart';
import 'package:pedidos_app/ui/input_decorations.dart';
import 'package:pedidos_app/utils/properties_util.dart';
import 'package:pedidos_app/widgets/bottom_menu.dart';
import 'package:pedidos_app/widgets/home_page/custom_dish_card.dart';
import 'package:pedidos_app/widgets/home_page/custom_listtile_restaurant.dart';
import 'package:pedidos_app/widgets/home_page/section_title_lable.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: _getCustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _SearchCustomWidget(),

            // Section title lable
            SectionTitleLabel(
              title: 'Today New Arivable',
              subtitle: 'Best of the today  food list update',
            ),
            // Lista de platos
            _CustomListDishes(),
            SizedBox(height: 20),

            // Section title lable
            SectionTitleLabel(
              title: 'Explore Restaurant',
              subtitle: 'Check your city Near by Restaurant',
            ),
            _CustomListRestaurants(),
          ],
        ),
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

class _CustomListRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          CustomListTileRestaurants(),
          CustomListTileRestaurants(),
          CustomListTileRestaurants(),
          SizedBox(height: 30),
        ],
      ),
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
