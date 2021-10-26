import 'package:flutter/material.dart';

class DireccionFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String fullName = '';
  String celular = '';
  String tipo_direccion = '';
  String direccion = '';
  String nro_lote = '';
  String depto_int = '';
  String urbanizacion = '';
  String referencia = '';
  String departamento = '';
  String provincia = '';
  String distrito = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    this._isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    return formKey.currentState?.validate() ?? false;
  }
}
