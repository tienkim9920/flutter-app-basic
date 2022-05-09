import 'package:flutter/material.dart';

class ModalCenter extends StatelessWidget {
  final Function handleDelete;
  final Function handleCancel;
  final String idItem;

  const ModalCenter(this.handleDelete, this.handleCancel, this.idItem,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 840,
      color: Colors.black.withOpacity(.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.fromLTRB(30, 15, 30, 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bạn có muốn xóa không',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFB93119))),
                          onPressed: () => handleCancel(),
                          icon: Icon(Icons.close),
                          label: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Hủy',
                                  style: TextStyle(color: Colors.white)))),
                      ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(48, 135, 189, 1))),
                          onPressed: () => handleDelete(idItem),
                          icon: Icon(Icons.approval),
                          label: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Xác nhận',
                                  style: TextStyle(color: Colors.white)))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
