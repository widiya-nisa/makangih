import 'package:dio/dio.dart';
import 'package:makangih/helpers/api_client.dart';
import 'package:makangih/helpers/api_client2.dart';
import 'package:makangih/model/makanan.dart';
import 'package:makangih/model/minuman.dart';
import 'package:makangih/model/user.dart';

class MinumanService {
  Future<List<Minuman>> listData() async {
    final Response response = await ApiClient().get('minuman');
    final List data = response.data as List;
    List<Minuman> result = data.map((json) => Minuman.fromJson(json)).toList();
    return result;
  }

  Future<Minuman> simpan(Minuman minuman) async {
    var data = minuman.toJson();
    final Response response = await ApiClient().post('minuman', data);
    Minuman result = Minuman.fromJson(response.data);
    return result;
  }

  Future<Minuman> ubah(Minuman minuman, String id) async {
    var data = minuman.toJson();
    final Response response = await ApiClient().put('minuman/$id', data);
    // print(response);
    Minuman result = Minuman.fromJson(response.data);
    return result;
  }

  Future<Minuman> getById(String id) async {
    final Response response = await ApiClient().get('minuman/$id');
    Minuman result = Minuman.fromJson(response.data);
    return result;
  }

  Future<Minuman> hapus(Minuman minuman) async {
    final Response response =
        await ApiClient().delete('minuman/${minuman.id}');
    Minuman result = Minuman.fromJson(response.data);
    return result;}
}