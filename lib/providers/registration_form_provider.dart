import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class RegistrationFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String _baseUrl = 'localhost:8080';

  String fullName = '';
  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    this._isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<http.Response> registerNewUser(String endpoint) async {
    var url = Uri.http(_baseUrl, endpoint);

    Map<String, String> headers = {
      "Content-Type": "application/json", 
      "Accept" : "application/json"
    };
    
    Map<String, dynamic> newUser = {
      'nombres': fullName,
      'apellidos': fullName,
      'dni': '12345678',
      'correo': email,
      'password': password,
    };

    return await http.post(url, headers: headers, body: jsonEncode(newUser));
  }

  void guardarToken(String token) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString('token', token);
  }

}
