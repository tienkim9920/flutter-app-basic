import 'dart:convert';

import 'package:get/get.dart';
import 'package:world_time/models-interface/album.interface.dart';
import 'package:world_time/models/albums.model.dart';
import 'package:world_time/service/album.service.dart';

class AlbumController extends GetxController {
  final test = 0.obs;
  final isLoading = true.obs;
  final albums = [].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var data = await AlbumService().getAlbums();
      if (data != null) {
        albums.value = data;
      }
    } finally {
      isLoading(false);
    }
  }

  void postData(String request) async {
    try {
      isLoading(true);
      var data = await AlbumService().postAlbum(request);
      if (data != null) {
        var res = jsonDecode(data);
        albums.value.add(res);
      }
    } finally {
      isLoading(false);
    }
  }
}
