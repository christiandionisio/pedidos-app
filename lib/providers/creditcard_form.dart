

import 'package:flutter/material.dart';

class CreditCardFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String _numeroTarjeta = '';
  String _vigencia = '';
  String _nombreTitular = '';

  String get numeroTarjeta => _numeroTarjeta;
  String get vigencia => _vigencia;
  String get nombreTitular => _nombreTitular;

  set numeroTarjeta (String value) {
    _numeroTarjeta = value;
    notifyListeners();
  }

  set vigencia (String value) {
    _vigencia = value;
    notifyListeners();
  }

  set nombreTitular (String value) {
    _nombreTitular = value;
    notifyListeners();
  }

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