import 'package:flutter/material.dart';
import 'package:world_time/models/checklist.model.dart';

class ChecklistComponent extends StatelessWidget {
  final dynamic checklistModel;
  final Function onDelete;
  final Function onDetail;
  const ChecklistComponent(this.checklistModel, this.onDelete, this.onDetail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: GestureDetector(
          onTap: () => onDetail(checklistModel['Id']),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  checklistModel['p1'],
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  checklistModel['p2'],
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  '${checklistModel['p3']} ${checklistModel['p4']} ${checklistModel['p5']}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8.0),
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(48, 135, 189, 1))),
                    onPressed: () => onDelete(checklistModel['Id']),
                    icon: Icon(Icons.delete),
                    label: Text('Xóa'))
              ],
            ),
          ),
        ));
  }
}