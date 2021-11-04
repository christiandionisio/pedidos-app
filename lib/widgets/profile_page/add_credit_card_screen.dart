import 'package:flutter/material.dart';
import 'package:pedidos_app/providers/creditcard_form.dart';
import 'package:pedidos_app/ui/input_decorations.dart';
import 'package:pedidos_app/utils/properties_util.dart';
import 'package:provider/provider.dart';


class CreditCardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Agregar Tarjeta'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: BouncingScrollPhysics(),
        child: Column(
          children:[
            _CreditCardPreview(),
            SizedBox(height: 30),
            _AgregarCreditCardForm(),
          ],
        ),
      ),
   );
  }
}

class _CreditCardPreview extends StatelessWidget {
  const _CreditCardPreview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final creditCardForm = Provider.of<CreditCardFormProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        border:   Border.all(
          color: PropertiesUtil.primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.credit_card, size: 35, color: PropertiesUtil.primaryColor),
          SizedBox(height: 20),
          Text( (creditCardForm.numeroTarjeta != '')
            ? creditCardForm.numeroTarjeta
            : '**** **** **** ****', 
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text( (creditCardForm.vigencia != '')
            ? creditCardForm.vigencia
            : 'MM/YY', 
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 10),
          Text( (creditCardForm.nombreTitular != '')
            ? creditCardForm.nombreTitular
            : 'NOMBRE APELLIDO', 
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _AgregarCreditCardForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final creditCardForm = Provider.of<CreditCardFormProvider>(context);
    return Container(
      child: Form(
        // TODO mantener la referencia al KEY
        key: creditCardForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Numero de tarjeta',
                labelText: 'Numero de tarjeta',
                prefixIcon: Icons.credit_card,
              ),
              onChanged: (value) => creditCardForm.numeroTarjeta = value,
              validator: (value) {
                return (value != null && value.length >= 1) 
                  ? null 
                  : 'Debe completar este campo';
              },
            ),
            SizedBox(height: 20),

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Vigencia',
                labelText: 'Vigencia',
                prefixIcon: Icons.date_range_outlined,
              ),
              onChanged: (value) => creditCardForm.vigencia = value,
              validator: (value) {
                return (value != null && value.length >= 1) 
                  ? null 
                  : 'Debe completar este campo';
              },
            ),
            SizedBox(height: 20),

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Nombre del titular',
                labelText: 'Nombre del titular',
                prefixIcon: Icons.person_outline_outlined,
              ),
              onChanged: (value) => creditCardForm.nombreTitular = value,
              validator: (value) {
                return (value != null && value.length >= 1) 
                  ? null 
                  : 'Debe completar este campo';
              },
            ),
            SizedBox(height: 30),
            
            
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: PropertiesUtil.primaryColor,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  creditCardForm.isLoading ? 'Espere' : 'Guardar Cambios',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: creditCardForm.isLoading
                  ? null
                  : () {
                      Navigator.pop(context);
                    },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _getCustomTextField(String field, String hintText, String title,
      String errorMesssage, IconData? icon) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.text,
      decoration: InputDecorations.authInputDecoration(
        hintText: hintText,
        labelText: title,
        prefixIcon: (icon != null) ? icon : null,
      ),
      onChanged: (value) => field = value,
      validator: (value) {
        return (value != null && value.length >= 1) ? null : errorMesssage;
      },
    );
  }
}
