import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PropertiesUtil.getCardDecoration,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.all(5),
      width: 300,
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
                    child: Icon(Icons.delete_outline_sharp,
                        color: PropertiesUtil.dangerColor),
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
    );
  }
}
