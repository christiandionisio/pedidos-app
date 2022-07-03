import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pedidos_app/providers/registration_form_provider.dart';
import 'package:pedidos_app/ui/input_decorations.dart';
import 'package:pedidos_app/utils/properties_util.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registrationForm = Provider.of<RegistrationFormProvider>(context);

    return Container(
      child: Form(
        // TODO mantener la referencia al KEY
        key: registrationForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Enter your full name here',
                labelText: 'Full Name',
                prefixIcon: Icons.person,
              ),
              onChanged: (value) => registrationForm.fullName = value,
              validator: (value) {
                return (value != null && value.length >= 1)
                    ? null
                    : 'Debe completar este campo';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo Electrónico',
                prefixIcon: Icons.alternate_email_rounded,
              ),
              onChanged: (value) => registrationForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';
              },
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '*****',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline,
                ),
                onChanged: (value) => registrationForm.password = value,
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : 'La contraseña debe ser de 6 caracteres';
                },
              ),
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
                  registrationForm.isLoading ? 'Espere' : 'Registration',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: registrationForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();

                      if (!registrationForm.isValidForm()) {
                        return;
                      }

                      registrationForm.isLoading = true;

                      Response response = await registrationForm.registerNewUser('auth/register');

                      if (response.statusCode == 200) {
                        final body = json.decode(response.body);
                        registrationForm.guardarToken(body['token']);
                        registrationForm.isLoading = false;

                        Navigator.pushReplacementNamed(context, 'home_screen');
                      } else {
                        // TODO: mostrar popup de error
                        print('error');
                      }

                      registrationForm.isLoading = false;
                    },
            ),
            SizedBox(height: 15),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: PropertiesUtil.colorGoogleButtonStyle,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 52, vertical: 15),
                child: Text('Sign up with Google'),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
