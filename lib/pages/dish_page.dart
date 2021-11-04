import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class DishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plato X'),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        child: Column(
          children: [
            // Image container
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image(image: AssetImage('assets/home/cover.jpg'))),
            ),

            // TODO: pasar parámetros por constructor
            //Title container
            _TitleContainer(),

            // TODO: pasar parámetros por constructor
            // Description Container
            _DescriptionContainer(),

            // Aditional description container
            _AditionalDescriptionContainer(),
            SizedBox(height: 35),

            // Aditional Instructions Container
            _AditionalInstructionsContainer(),
            Spacer(),
            // Bottom Buttons
            _AddCartContainer(),
          ],
        ),
      ),
    );
  }
}

class _AddCartContainer extends StatefulWidget {
  const _AddCartContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<_AddCartContainer> createState() => _AddCartContainerState();
}

class _AddCartContainerState extends State<_AddCartContainer> {
  int contadorItems = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Contador de items
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFFF5F5F8),
            ),
            height: 60,
            child: Row(
              children: [
                getOperationCounterButton(Icons.remove),
                getCountValue(),
                getOperationCounterButton(Icons.add),
              ],
            ),
          ),

          // Button Add To Cart
          getAddCartButton(),
        ],
      ),
    );
  }

  ClipRRect getAddCartButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 190,
        height: 60,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Add To Cart'),
        ),
      ),
    );
  }

  Container getCountValue() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        '$contadorItems',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  RawMaterialButton getOperationCounterButton(IconData icon) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(Size(36, 36)),
      onPressed: () {
        if (icon == Icons.remove) {
          if (contadorItems == 1) {
            contadorItems = 1;
          } else {
            contadorItems--;
          }
        } else {
          contadorItems++;
        }

        setState(() {});
      },
      child: Icon(
        icon,
        size: 25.0,
        color: (icon == Icons.add) ? PropertiesUtil.primaryColor : Colors.black,
      ),
      shape: CircleBorder(),
    );
  }
}

class _AditionalInstructionsContainer extends StatelessWidget {
  const _AditionalInstructionsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Center(child: Text('Aditional Instruction')),
    );
  }
}

class _AditionalDescriptionContainer extends StatelessWidget {
  const _AditionalDescriptionContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // Rating box
          _getRatingBox(),
          SizedBox(width: 40),

          // Tiempo proomedio
          _getTimeBox(),
          SizedBox(width: 40),

          Text('Delivery fee \$2.000')
        ],
      ),
    );
  }

  Container _getTimeBox() {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.watch_later_outlined,
            size: 20,
          ),
          Text('30 Mins'),
        ],
      ),
    );
  }

  Container _getRatingBox() {
    return Container(
      width: 60,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            size: 20,
          ),
          Text('4.5'),
        ],
      ),
    );
  }
}

class _DescriptionContainer extends StatelessWidget {
  const _DescriptionContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'The robust gravy is made with ingredients including garlic, ginger, and lemongrass which are pounded into a paste and then braised in flavorsome coconut milk.',
        style: TextStyle(
          color: PropertiesUtil.onboardingTextBodyColor,
        ),
      ),
    );
  }
}

class _TitleContainer extends StatelessWidget {
  const _TitleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SizedBox(
            width: 228,
            child: Text(
              'Chicken Biyani',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            '\$79.99',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
