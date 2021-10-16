import 'package:flutter/material.dart';
import 'package:pedidos_app/pages/home_page.dart';
import 'package:pedidos_app/pages/profile_page.dart';
import 'package:pedidos_app/widgets/home_page/side_menu.dart';
import 'cart_page.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      drawer: NavDrawer(),
      appBar: _getCustomAppBar(),
      body: Container(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _getBottomNavigatorBar(),
    );
  }

  Container _getBottomNavigatorBar() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 14,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          iconSize: 35,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int index) {
            setState(() {
              this._selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.list_alt_outlined),
              label: 'Historial',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person_outline),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }

  AppBar _getCustomAppBar() {
    return AppBar(
      title: Text('App Pedidos'),
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
