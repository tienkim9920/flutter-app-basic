import 'package:flutter/material.dart';

class LineComponent extends StatelessWidget {
  final String textDay;
  final List<dynamic> today;
  final Function onEvent;
  const LineComponent(this.textDay, this.today, this.onEvent, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  color: Color.fromRGBO(48, 135, 189, 1), width: 10)),
          color: Colors.white,
        ),
        child: Row(children: [
          Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text(
                textDay,
                style: TextStyle(
                    color: Color.fromRGBO(48, 135, 189, 1), fontSize: 20),
              )),
          Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(48, 135, 189, 1),
            ),
          ),
        ]),
      ),
      Container(
        width: MediaQuery.of(context).size.width - 160,
        height: 60,
        color: Colors.white,
        child: DragTarget(
          builder: (context, candidateData, rejectedData) => Center(
              child: Column(
            children: [
              ...today
                  .map((item) => Draggable(
                      data: item,
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 160) /
                            today.length,
                        height: 75,
                        color: Color.fromRGBO(48, 135, 189, 1),
                        padding: EdgeInsets.all(5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['p1'],
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${item['p3']}h${item['p4']} ${item['p5']}',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                      ),
                      feedback: Container(
                        width: (MediaQuery.of(context).size.width - 160) /
                            today.length,
                        height: 75,
                        color: Color.fromRGBO(48, 135, 189, 1),
                        padding: EdgeInsets.all(5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['p1'],
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '${item['p3']}h${item['p4']} ${item['p5']}',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                      )))
                  .toList(),
            ],
          )),
          onWillAccept: (data) => true,
          onAccept: (dynamic data) => onEvent(data),
        ),
      ),
    ]);
  }
}
