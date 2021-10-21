import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // Profile Card
            Container(
              decoration: _getCardDecoration(),
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
                        // TODO: ir a editar usuario
                        print('Editar usuario');
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Accoun Settings Card
            Container(
              decoration: _getCardDecoration(),
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
            ),

            // Direccion Card
            Container(
              decoration: _getCardDecoration(),
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
                      print('Editar usuario');
                    },
                  ),
                ),
              ),
            ),

            // Tarjeta de pago Card
            Container(
              decoration: _getCardDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: const EdgeInsets.all(5),
              height: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo tarjeta
                      Image(
                        image: AssetImage('assets/home/mastercard.png'),
                        width: 44,
                        fit: BoxFit.cover,
                      ),

                      // Eliminar tarjeta
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onTap: () {
                            // TODO: ELIMINAR
                            print("Eliminarr");
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Icon(Icons.delete_outline_sharp),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 7),
                  Text("XXXX XXXX XXXX 4567"),
                  SizedBox(height: 7),
                  Text("Vigencia   09/2025"),
                  SizedBox(height: 5),
                  Text("CHRISTIAN DIONISIO TRIVEÑO"),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Logout Button
            Container(
              width: 111,
              child: ElevatedButton(
                child: Text("Logout"),
                onPressed: () {
                  // TODO: LOGOUT
                },
                style: PropertiesUtil.styleDangerButton,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _getCardDecoration() {
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 1.0,
        ),
      ],
    );
  }
}
