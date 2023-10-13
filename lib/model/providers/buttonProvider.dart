// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:syrpronet/networking/constants.dart';

class ButtonProvider with ChangeNotifier {
  bool _isHidden1 = true;
  bool get isHidden1 => _isHidden1;
  set isHidden1(bool value) {
    this._isHidden1 = value;
    notifyListeners();
  }

  bool _isHidden2 = true;
  bool get isHidden2 => _isHidden2;
  set isHidden2(bool value) {
    this._isHidden2 = value;
    notifyListeners();
  }
  String _dialCode = "+963";
  String? _numberOfStep = 'Step 1 of 2';

  String get numberOfStep => _numberOfStep!;

  set numberOfStep(String value) {
    _numberOfStep = value;
    notifyListeners();
  }

  double? _progress = 0.35;
  double get progress => _progress!;
  set progress(double value) {
    _progress = value;
    notifyListeners();
  }

  TextStyle? _departmentsButton = const TextStyle(
    color: kSecondaryColor,
  );

  TextStyle get departmentsButton => _departmentsButton!;

  set departmentsButton(TextStyle value) {
    _departmentsButton = value;
    notifyListeners();
  }

  TextStyle? _teamsButton = const TextStyle(
    color: Colors.grey,
  );

  TextStyle get teamsButton => _teamsButton!;

  set teamsButton(TextStyle value) {
    _teamsButton = value;
    notifyListeners();
  }

  bool? _isDepartmens = true;
  bool get isDepartments => _isDepartmens!;
  set isDepartments(bool value) {
    _isDepartmens = value;
    notifyListeners();
  }

  int? _indexOfSymbolizes = -1;

  int get indexOfSymbolizes => _indexOfSymbolizes!;

  set indexOfSymbolizes(int value) {
    _indexOfSymbolizes = value;
    notifyListeners();
  }

  Color _containerColor = Colors.white;

  Color get containerColor => _containerColor;

  set containerColor(Color value) {
    _containerColor = value;
    notifyListeners();
  }

  String _floatingButton = 'Skip >';

  String get floatingButton => _floatingButton;

  set floatingButton(String value) {
    _floatingButton = value;
    notifyListeners();
  }

  ThemeMode themeMode = ThemeMode.light;
  bool isChange = false;
  void themeModeChange(bool value) {
    if (value) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  double? _filter = 0.062;
  double get filter => _filter!;
  set filter(double value) {
    _filter = value;
    notifyListeners();
  }

  Color? _all = kPrimaryColor;
  Color? _tomorrow = Colors.transparent;
  Color? _afterTomorrow = Colors.transparent;
  Color? _today = Colors.transparent;

  Color get all => _all!;

  set all(Color value) {
    _all = value;
    notifyListeners();
  }

  Color get tomorrow => _tomorrow!;

  set tomorrow(Color value) {
    _tomorrow = value;
    notifyListeners();
  }

  Color get afterTomorrow => _afterTomorrow!;

  set afterTomorrow(Color value) {
    _afterTomorrow = value;
    notifyListeners();
  }

  Color get today => _today!;

  set today(Color value) {
    _today = value;
    notifyListeners();
  }

  int _projectTeamLength = projectTeam.length;
  int get projectTeamLength => _projectTeamLength;
  set projectTeamLength(int value) {
    _projectTeamLength = value;
    notifyListeners();
  }

  bool _addProjectTeam = false;
  bool get addProjectTeam => _addProjectTeam;
  set addProjectTeam(bool value) {
    _addProjectTeam = value;
    notifyListeners();
  }

  Color _todayUpEvent = kSecondaryColor;
  Color _tomorrowUpEvent = kGrayColor;
  Color get todayUpEvent => _todayUpEvent;
  set todayUpEvent(Color value) {
    _todayUpEvent = value;
    notifyListeners();
  }

  Color get tomorrowUpEvent => _tomorrowUpEvent;
  set tomorrowUpEvent(Color value) {
    _tomorrowUpEvent = value;
    notifyListeners();
  }

  bool _isToday = true;
  bool get isToday => _isToday;
  set isToday(bool value) {
    _isToday = value;
    notifyListeners();
  }

  Color _allNews = kSecondaryColor;
  Color _eventNews = kGrayColor;
  Color _projectNews = kGrayColor;
  Color get allNews => _allNews;
  Color get eventNews => _eventNews;
  Color get projectNews => _projectNews;
  set allNews(Color value) {
    _allNews = value;
    notifyListeners();
  }

  set eventNews(Color value) {
    _eventNews = value;
    notifyListeners();
  }

  set projectNews(Color value) {
    _projectNews = value;
    notifyListeners();
  }

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
    notifyListeners();
  }

  Color _profileBorder = kGrayColor;

  Color get profileBorder => _profileBorder;

  set profileBorder(Color value) {
    _profileBorder = value;
    notifyListeners();
  }

  int _indexOfProfile = -1;

  int get indexOfProfile => _indexOfProfile;

  set indexOfProfile(int value) {
    _indexOfProfile = value;
    notifyListeners();
  }

  int _delete = 1;

  int get delete => _delete;

  set delete(int value) {
    _delete = value;
    notifyListeners();
  }
}
