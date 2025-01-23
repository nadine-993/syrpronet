import 'package:flutter/material.dart';

class ListProvider with ChangeNotifier {
  String? _roleValue;

  String get roleValue => _roleValue!;

  set roleValue(String value) {
    _roleValue = value;
    notifyListeners();
  }

  String? _sectorValue;

  String get sectorValue => _sectorValue!;

  set sectorValue(String value) {
    _sectorValue = value;
    notifyListeners();
  }

  String? _countryCodeValue = '+963';

  String get countryCodeValue => _countryCodeValue!;

  set countryCodeValue(String value) {
    _countryCodeValue = value;
  }
}
