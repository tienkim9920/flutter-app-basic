import 'package:flutter/material.dart';

class AddBook extends StatelessWidget {
  final TextEditingController quoteInput;
  final Function onAddBook;

  const AddBook(this.quoteInput, this.onAddBook, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(17.0, 0.0, 5.0, 0.0),
            child: TextFormField(
              controller: quoteInput,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your book',
              ),
            ),
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 15.0, 0.0),
            child: SizedBox(
              height: 35,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(13, 71, 161, 1))),
                onPressed: () => onAddBook(quoteInput.text),
                icon: Icon(Icons.add),
                label: Text('Add'),
              ),
            ),
          ),
          flex: 1,
        )
      ],
    );
  }
}
