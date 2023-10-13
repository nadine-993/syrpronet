import 'package:flutter/material.dart';

class ValidateDropProvider with ChangeNotifier {
  String _roleValidate = ' ';

  String get roleValidate => _roleValidate;

  set roleValidate(String value) {
    _roleValidate = value;
    notifyListeners();
  }

  String _sectorValidate = ' ';

  String get sectorValidate => _sectorValidate;

  set sectorValidate(String value) {
    _sectorValidate = value;
    notifyListeners();
  }

  String _projectValidate = ' ';
  String get projectValidate => _projectValidate;
  set projectValidate(String value) {
    _projectValidate = value;
    notifyListeners();
  }

  bool _isHidden = false;

  bool get isHidden => _isHidden;

  set isHidden(bool value) {
    _isHidden = value;
    notifyListeners();
  }
}
