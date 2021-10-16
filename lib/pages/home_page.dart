import 'package:flutter/material.dart';
import 'package:pedidos_app/ui/input_decorations.dart';
import 'package:pedidos_app/widgets/home_page/custom_dish_card.dart';
import 'package:pedidos_app/widgets/home_page/custom_listtile_restaurant.dart';
import 'package:pedidos_app/widgets/home_page/section_title_lable.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

class _CustomListRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: const [
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
