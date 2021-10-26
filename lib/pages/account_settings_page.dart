import 'package:flutter/material.dart';
import 'package:pedidos_app/providers/perfil_form_provider.dart';
import 'package:pedidos_app/ui/input_decorations.dart';
import 'package:pedidos_app/utils/properties_util.dart';
import 'package:provider/provider.dart';

class AccountSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // Avatar Perfil
            _AvatarPerfil(),
            SizedBox(height: 20),

            // Formulario datos
            _EditarPerfilForm(),
          ],
        ),
      ),
    );
  }
}

class _EditarPerfilForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final perfilForm = Provider.of<PerfilFormProvider>(context);
    return Container(
      child: Form(
        // TODO mantener la referencia al KEY
        key: perfilForm.formKey,
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
              onChanged: (value) => perfilForm.fullName = value,
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
              onChanged: (value) => perfilForm.email = value,
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
                onChanged: (value) => perfilForm.password = value,
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
                  perfilForm.isLoading ? 'Espere' : 'Guardar Cambios',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: perfilForm.isLoading
                  ? null
                  : () async {
                      Navigator.pop(context);
                    },
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          child: Image(
            image: AssetImage('assets/home/avatar.jpg'),
            fit: BoxFit.scaleDown,
            height: 200,
          ),
        ),
      ),
    );
  }
}
