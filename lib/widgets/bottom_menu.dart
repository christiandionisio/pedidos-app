import 'package:flutter/material.dart';

class BottomPrincipalMenu extends StatefulWidget {
  const BottomPrincipalMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomPrincipalMenu> createState() => _BottomPrincipalMenuState();
}

class _BottomPrincipalMenuState extends State<BottomPrincipalMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          currentIndex: selectedIndex,
          iconSize: 35,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int index) {
            setState(() {
              this.selectedIndex = index;
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
}
