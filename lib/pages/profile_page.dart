import 'package:flutter/material.dart';
import 'package:pedidos_app/widgets/profile_page/account_settings_card.dart';
import 'package:pedidos_app/widgets/profile_page/direction_card.dart';
import 'package:pedidos_app/widgets/profile_page/logout_button.dart';
import 'package:pedidos_app/widgets/profile_page/payment_card.dart';
import 'package:pedidos_app/widgets/profile_page/profile_card.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          // Profile Card
          ProrfileCard(),
          SizedBox(height: 30),

          // Accoun Settings Card
          // AccountSettingsCard(),

          // Direccion Card
          DirectionCard(),
          SizedBox(height: 5),

          // Tarjeta de pago Card
          _LabelListCustomCard(),
          _ListViewPaymentCard(),
          SizedBox(height: 20),

          // Logout Button
          LogoutButton(),
        ],
      ),
    );
  }
}

class _ListViewPaymentCard extends StatelessWidget {
  const _ListViewPaymentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return PaymentCard();
          }),
    );
  }
}

class _LabelListCustomCard extends StatelessWidget {
  const _LabelListCustomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Tarjetas Guardadas"),
          InkWell(
            child: Container(
              width: 30,
              height: 30,
              child: Icon(Icons.add),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'add_credit_card_screen');
            },
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
