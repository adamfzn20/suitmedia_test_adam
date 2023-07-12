import 'package:dio/dio.dart';
import 'package:suitmedia_test_adam/models/user_model.dart';

class ServiceRestApi {
  final Dio _dio = Dio();

  Future<List<UserModel>> getUsers({int page = 1, int perPage = 10}) async {
    try {
      List<UserModel> userData = [];
      final response = await _dio.get(
        'https://reqres.in/api/users',
        queryParameters: {'page': page, 'per_page': perPage},
      );

      //progress wait 1 second
      await Future.delayed(const Duration(seconds: 1));

      if (response.data['data'] != null) {
        for (var json in response.data['data']) {
          userData.add(UserModel.fromJson(json));
        }
      }

      return userData;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
