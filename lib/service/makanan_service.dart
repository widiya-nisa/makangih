import 'package:dio/dio.dart';
import 'package:makangih/helpers/api_client.dart';
import 'package:makangih/helpers/api_client2.dart';
import 'package:makangih/model/makanan.dart';
import 'package:makangih/model/user.dart';

class MakananService {
  Future<List<Makanan>> listData() async {
    final Response response = await ApiClient2().get('makanan');
    final List data = response.data as List;
    List<Makanan> result = data.map((json) => Makanan.fromJson(json)).toList();
    return result;
  }

  Future<Makanan> simpan(Makanan makanan) async {
    var data = makanan.toJson();
    final Response response = await ApiClient2().post('makanan', data);
    Makanan result = Makanan.fromJson(response.data);
    return result;
  }

  Future<Makanan> ubah(Makanan makanan, String id) async {
    var data = makanan.toJson();
    final Response response = await ApiClient2().put('makanan/$id', data);
    // print(response);
    Makanan result = Makanan.fromJson(response.data);
    return result;
  }

  Future<Makanan> getById(String id) async {
    final Response response = await ApiClient2().get('makanan/$id');
    Makanan result = Makanan.fromJson(response.data);
    return result;
  }

  Future<Makanan> hapus(Makanan makanan) async {
    final Response response =
        await ApiClient2().delete('Makanan/${makanan.id}');
    Makanan result = Makanan.fromJson(response.data);
    return result;}
}