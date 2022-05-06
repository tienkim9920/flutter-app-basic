class AlbumInterface {
  String? title;
  String? username;
  String? body;
  String? phone;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['title'] = this.title;
    data['username'] = this.username;
    data['body'] = this.body;
    data['phone'] = this.phone;
    return data;
  }
}
