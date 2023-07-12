import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class UserProvider with ChangeNotifier {
  late User _user;
  SharedPreferences? _preferences;

  User get user => _user;

  UserProvider() {
    _user = User(name: '');

    _initPreferences();
    _getUserData();
  }

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> _getUserData() async {
    final name = _preferences?.getString('name') ?? '';
    _user = User(name: name);
    notifyListeners();
  }

  Future<void> saveUserData() async {
    await _preferences?.setString('name', _user.name);
  }

  void setName(String name) {
    _user = User(name: name);
    notifyListeners();
  }
}
