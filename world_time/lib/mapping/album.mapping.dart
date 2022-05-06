import 'dart:convert';

import 'package:world_time/models-interface/album.interface.dart';
import 'package:world_time/models/albums.model.dart';

class AlbumMapping {
  dynamic MapServiceAlbum(AlbumModel model) {
    AlbumInterface albumInterface = AlbumInterface();
    albumInterface.title = model.title;
    albumInterface.username = model.username;
    albumInterface.body = model.body;
    albumInterface.phone = model.phone;

    return json.encode(albumInterface.toJson());
  }
}
