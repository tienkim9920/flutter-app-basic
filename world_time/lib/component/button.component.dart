import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final double paddingLeft;
  final double paddingRight;
  final String text;
  final String id;
  final Function excutiveEvent;
  final IconData icon;
  final bool widthHorizontal;

  const ButtonIcon(this.paddingLeft, this.paddingRight, this.text,
      this.id, this.excutiveEvent, this.icon, this.widthHorizontal,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widthHorizontal ? MediaQuery.of(context).size.width : null,
          child: Padding(
              padding: EdgeInsets.fromLTRB(paddingLeft, 0, paddingRight, 0),
              child: SizedBox(
                  height: 40,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(48, 135, 189, 1)),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60.0))),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0))),
                    onPressed: () => excutiveEvent(id),
                    label: Text(text),
                    icon: Icon(icon),
                  ))),
        )
      ],
    );
  }
}