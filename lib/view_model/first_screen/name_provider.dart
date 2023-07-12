import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/name_model.dart';

class NameProvider with ChangeNotifier {
  late NameModel _name;
  SharedPreferences? _preferences;

  NameModel get name => _name;

  NameProvider() {
    _name = NameModel(name: '');

    _initPreferences();
    _getUserData();
  }

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> _getUserData() async {
    final name = _preferences?.getString('name') ?? '';
    _name = NameModel(name: name);
    notifyListeners();
  }

  Future<void> saveUserData() async {
    await _preferences?.setString('name', _name.name);
  }

  void setName(String name) {
    _name = NameModel(name: name);
    notifyListeners();
  }
}
