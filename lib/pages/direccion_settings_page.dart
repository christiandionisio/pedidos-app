import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:pedidos_app/providers/direccion_form_provider.dart';
import 'package:pedidos_app/ui/input_decorations.dart';
import 'package:pedidos_app/utils/properties_util.dart';
import 'package:provider/provider.dart';

class DireccionSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Dirección'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _EditarDireccionForm(),
          ],
        ),
      ),
    );
  }
}

class _EditarDireccionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final direccionForm = Provider.of<DireccionFormProvider>(context);
    return Container(
      child: Form(
        // TODO mantener la referencia al KEY
        key: direccionForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [
            _getCustomTextField(
              direccionForm.fullName,
              'Enter your full name here',
              'Full Name',
              'Debe completar este campo',
              Icons.person,
            ),
            SizedBox(height: 20),
            _getCustomTextField(
              direccionForm.celular,
              'Ingrese su número de celular ',
              'Celular',
              'Debe completar este campo',
              Icons.phone_android,
            ),
            SizedBox(height: 20),
            _getCustomTextField(
              direccionForm.tipo_direccion,
              'Casa, Dpto, Oficina, etc',
              'Tipo de Dirección',
              'Debe completar este campo',
              Icons.home_work_outlined,
            ),
            SizedBox(height: 20),
            _getCustomTextField(
              direccionForm.direccion,
              'Ingrese su dirección',
              'Dirección',
              'Debe completar este campo',
              Icons.place,
            ),
            SizedBox(height: 20),
            _getCustomTextField(
              direccionForm.nro_lote,
              'Ingrese su número/lote',
              'Nro/Lote',
              'Debe completar este campo',
              Icons.account_box_outlined,
            ),
            SizedBox(height: 20),
            _getCustomTextField(
              direccionForm.depto_int,
              'Dept / Int (opcional)',
              'Dept / Int (opcional)',
              'Debe completar este campo',
              null,
            ),
            SizedBox(height: 20),
            _getCustomTextField(
              direccionForm.urbanizacion,
              'Urbanización (opcional)',
              'Urbanización (opcional)',
              'Debe completar este campo',
              null,
            ),
            SizedBox(height: 20),
            _getCustomTextField(
              direccionForm.referencia,
              'Referencia (opcional)',
              'Referencia (opcional)',
              'Debe completar este campo',
              null,
            ),
            SizedBox(height: 20),
            _getCustomTextField(
              direccionForm.departamento,
              'Departamento',
              'Departamento',
              'Debe completar este campo',
              null,
            ),
            SizedBox(height: 20),
            _getCustomTextField(
              direccionForm.provincia,
              'Provincia',
              'Provincia',
              'Debe completar este campo',
              null,
            ),
            SizedBox(height: 20),
            _getCustomTextField(
              direccionForm.distrito,
              'Distrito',
              'Distrito',
              'Debe completar este campo',
              null,
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
                  direccionForm.isLoading ? 'Espere' : 'Guardar Cambios',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: direccionForm.isLoading
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
