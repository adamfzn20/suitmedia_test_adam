import 'package:flutter/material.dart';
import 'package:suitmedia_test_adam/services/service_restapi.dart';
import '../../models/user_model.dart';
import '../../utils/state/finite_state.dart';

class GetUsersListProvider extends ChangeNotifier {
  final service = ServiceRestApi();
  MyState state = MyState.loading;
  List<UserModel> userList = [];
  UserModel? _selectedUser;
  late int _currentPage = 1;

  UserModel? get selectedUser => _selectedUser;

  void getUserListData({bool refresh = false}) async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }

    try {
      if (refresh) {
        _currentPage = 1;
        userList.clear();
      }

      final response = await service.getUsers(page: _currentPage);
      // userList = response;
      // _currentPage++;
      userList.addAll(response);
      _currentPage++;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }

  void selectUser(UserModel user) {
    _selectedUser = user;
    notifyListeners();
  }
}
