import 'dart:io';

import 'package:flutter/material.dart';

class InformationProvider with ChangeNotifier {
  String? _fullName;
  String? _email;
  String? _password;
  String? _role;
  String? _sector;
  String? _number;
  String? _countryCode;
  String? _bio;
  String? _linkedIn;
  String? _softSkills;
  String? _dayPerWeek;
  String? _hourPerDay;
  int? _indexOfSymbolizes;
  String? _profilePicturePath;

  String get fullName => _fullName!;

  set fullName(String value) {
    _fullName = value;
    notifyListeners();
  }

  String get email => _email!;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get password => _password!;

  set password(String value) {
    _email = value;
    notifyListeners();
  }

  String get role => _role!;

  set role(String value) {
    _role = value;
    notifyListeners();
  }

  String get sector => _sector!;

  set sector(String value) {
    _sector = value;
    notifyListeners();
  }

  String get number => _number!;

  set number(String value) {
    _number = value;
    notifyListeners();
  }

  String get countryCode => _countryCode!;

  set countryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  String get softSkills => _softSkills!;

  set softSkills(String value) {
    _softSkills = value;
    notifyListeners();
  }

  String get linkedIn => _linkedIn!;

  set linkedIn(String value) {
    _linkedIn = value;
    notifyListeners();
  }

  String get bio => _bio!;

  set bio(String value) {
    _bio = value;
    notifyListeners();
  }

  String get hourPerDay => _hourPerDay!;

  set hourPerDay(String value) {
    _hourPerDay = value;
    notifyListeners();
  }

  String get dayPerWeek => _dayPerWeek!;

  set dayPerWeek(String value) {
    _dayPerWeek = value;
    notifyListeners();
  }

  int get indexOfSymbolizes => _indexOfSymbolizes!;

  set indexOfSymbolizes(int value) {
    _indexOfSymbolizes = value;
    notifyListeners();
  }

  String get profilePicturePath => _profilePicturePath!;

  set profilePicturePath(String value) {
    _profilePicturePath = value;
  }

  bool? internetAccessB;

  void internetAccess() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        internetAccessB = true;
        notifyListeners();
      }
    } on SocketException catch (_) {
      internetAccessB = false;
      notifyListeners();
    }
  }
}
