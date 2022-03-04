import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class ServiceWorldTime {
  Future<dynamic> getTime(String url) async {
    try {
      // make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      return DateFormat.jm().format(now);
    } catch (e) {
      return 'could not get time';
    }
  }
}
