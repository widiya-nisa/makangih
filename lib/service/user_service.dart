import 'package:dio/dio.dart';
import 'package:makangih/helpers/api_client.dart';
import 'package:makangih/model/user.dart';

class UserService {
  Future<List<User>> listData() async {
    final Response response = await ApiClient().get('user');
    final List data = response.data as List;
    List<User> result = data.map((json) => User.fromJson(json)).toList();
    return result;
  }

  Future<User> simpan(User user) async {
    var data = user.toJson();
    final Response response = await ApiClient().post('user', data);
    User result = User.fromJson(response.data);
    return result;
  }

  Future<User> ubah(User user, String id) async {
    var data = user.toJson();
    final Response response = await ApiClient().put('user/$id', data);
    // print(response);
    User result = User.fromJson(response.data);
    return result;
  }

  Future<User> getById(String id) async {
    final Response response = await ApiClient().get('User/$id');
    User result = User.fromJson(response.data);
    return result;
  }

  Future<User> hapus(User user) async {
    final Response response =
        await ApiClient().delete('user/${user.id}');
    User result = User.fromJson(response.data);
    return result;}
}