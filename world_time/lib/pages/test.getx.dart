import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time/getX/album.controller.dart';
import 'package:world_time/getX/count.controller.dart';
import 'package:world_time/getX/sum.controller.dart';
import 'package:world_time/getX/user.controller.dart';
import 'package:world_time/mapping/album.mapping.dart';
import 'package:world_time/models/albums.model.dart';

class TestGetX extends StatefulWidget {
  const TestGetX({Key? key}) : super(key: key);

  @override
  State<TestGetX> createState() => _TestGetXState();
}

class _TestGetXState extends State<TestGetX> {
  final AlbumController albumController = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'GetX',
            textAlign: TextAlign.center,
          ),
          GetBuilder<CountController>(
              init: CountController(),
              builder: (_) {
                return Text("Current Count: ${_.count}",
                    style: TextStyle(fontSize: 20, color: Colors.grey));
              }),
          GestureDetector(
            onTap: () {
              Get.find<CountController>().increment();
            },
            child: Container(
              width: 100,
              color: Colors.red,
              child: Text("Increment",
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
            ),
          ),
          SizedBox(height: 20),
          GetX<UserController>(
              init: UserController(),
              builder: (_) {
                return Text("Username: ${_.user.value.username}",
                    style: TextStyle(fontSize: 20, color: Colors.grey));
              }),
          Obx(() {
            return Text(
                "User Count: ${Get.find<UserController>().user.value.count}",
                style: TextStyle(fontSize: 20, color: Colors.grey));
          }),
          GestureDetector(
            onTap: () {
              Get.find<UserController>()
                  .updateUser(Get.find<UserController>().user.value.count);
            },
            child: Container(
              width: 100,
              color: Colors.red,
              child: Text("Update Customer",
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
            ),
          ),
          SizedBox(height: 20),
          GetX<SumController>(
            init: SumController(),
            builder: (_) {
              return Text("CountA: ${_.countA}",
                  style: TextStyle(fontSize: 20, color: Colors.grey));
            },
          ),
          GetX<SumController>(
            init: SumController(),
            builder: (_) {
              return Text("CountB: ${_.countB}",
                  style: TextStyle(fontSize: 20, color: Colors.grey));
            },
          ),
          Obx(() {
            return Text("Count Sum: ${Get.find<SumController>().sum}",
                style: TextStyle(fontSize: 20, color: Colors.grey));
          }),
          GestureDetector(
            onTap: () {
              Get.find<SumController>().incrementA();
            },
            child: Container(
              width: 100,
              color: Colors.red,
              child: Text("Increment A",
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.find<SumController>().incrementB();
            },
            child: Container(
              width: 100,
              color: Colors.red,
              child: Text("Increment B",
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            child: Obx(
              () {
                if (albumController.isLoading.value) {
                  return Text('Loading...');
                } else {
                  return ListView.builder(
                    itemCount: albumController.albums.length,
                    itemBuilder: (context, index) {
                      return Text(albumController.albums[index]['title'],
                          style: TextStyle(fontSize: 20, color: Colors.grey));
                    },
                  );
                }
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              AlbumModel albumModel =
                  AlbumModel('Test', 'Test', 'Test', 'Test');
              Get.find<AlbumController>()
                  .postData(AlbumMapping().MapServiceAlbum(albumModel));
            },
            child: Container(
              width: 100,
              color: Colors.red,
              child: Text("Post Album",
                  style: TextStyle(fontSize: 20, color: Colors.yellowAccent)),
            ),
          ),
        ],
      ),
    );
  }
}
