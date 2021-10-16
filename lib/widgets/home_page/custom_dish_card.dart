import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class CustomDishCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onTap: () {
            //TODO: enviar parámetros de platos
            Navigator.pushNamed(context, 'dish_screen');
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card Image
                    _getCardImage(),
                    const SizedBox(height: 10),

                    // Card Title
                    _getCardTitle(),
                    const SizedBox(height: 4),

                    // Card Subtitle
                    _getCardSubtitle(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _getCardSubtitle() {
    return SizedBox(
      width: 128,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(
            Icons.location_on,
            color: PropertiesUtil.primaryColor,
            size: 18,
          ),
          SizedBox(
            width: 95,
            child: Text(
              'Ambrosia Hotel & Restaurant',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: false,
              style: TextStyle(
                  fontSize: 13, color: PropertiesUtil.listTileTrailing),
            ),
          ),
        ],
      ),
    );
  }

  Text _getCardTitle() {
    return const Text(
      'Chicken Biryani',
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      overflow: TextOverflow.fade,
      maxLines: 1,
      softWrap: false,
    );
  }

  Image _getCardImage() {
    return const Image(
      image: AssetImage('assets/home/plato.png'),
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
