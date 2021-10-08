import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class CustomListTileRestaurants extends StatelessWidget {
  const CustomListTileRestaurants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.all(5),
      height: 110,
      child: ListTile(
        leading: const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image(
            image: AssetImage('assets/home/restaurant.jpeg'),
            width: 64,
            fit: BoxFit.cover,
          ),
        ),
        title: const Text(
          'Ambrosia Hotel & Restaurant',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: PropertiesUtil.primaryColor,
                size: 19,
              ),
              SizedBox(
                width: 150,
                child: const Text(
                  'kazi Deiry, Taiger Pass Chittagong',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: false,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: 88,
            height: 30,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Book'),
            ),
          ),
        ),
      ),
    );
  }
}
