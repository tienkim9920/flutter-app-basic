import 'dart:convert';

import 'package:http/http.dart';

class AlbumService {
  Map<String, String> headers = {"Content-type": "application/json"};
  String url = 'https://tienkim-crud.herokuapp.com/blogs';

  Future<dynamic> getAlbums() async {
    Response response = await get(
      Uri.parse(url),
      headers: headers,
    );
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> postAlbum(String request) async {
    Response response =
        await post(Uri.parse(url), headers: headers, body: request);
    return response.body;
  }
}
