import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getPost() async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    Map data = jsonDecode(response.body);
    print(data['title']);
  }

  @override
  void initState() {
    super.initState();

    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Text('Home Screen'),
      ),
    );
  }
}
