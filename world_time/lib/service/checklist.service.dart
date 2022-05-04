import 'dart:convert';

import 'package:http/http.dart';

class ChecklistService {
  Map<String, String> headers = {"Content-type": "application/json"};

  Future<dynamic> getTest() async {
    Response response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: headers,
    );
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> getChecklists() async {
    Response response = await get(
      Uri.parse(
          'http://api.phanmemquocbao.com/api/Doituong/getobjectsall?tokenget=lethibaotran'),
      headers: headers,
    );
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> postChecklist(String url) async {
    Response response = await get(
      Uri.parse(url),
      headers: headers,
    );
    return response.body;
  }

  Future<dynamic> deleteChecklist(int id) async {
    Response response = await get(
      Uri.parse(
          'http://api.phanmemquocbao.com/api/Doituong/deleteObject?id=${id}&tokende=lethibaotran'),
      headers: headers,
    );
    return response.body;
  }

  Future<dynamic> updateChecklist(String url) async {
    Response response = await get(
      Uri.parse(url),
      headers: headers,
    );
    return response.body;
  }
}
