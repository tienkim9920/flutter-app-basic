import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:world_time/component/add_book.dart';
import 'package:world_time/models/quote.dart';
import 'package:world_time/models/quote_card.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  TextEditingController quoteInput = TextEditingController();

  final int number = 0;

  List<Quote> quotes = [
    Quote('1', 'Oscar Wilde', 'Be yourself; everyone else is already taken'),
    Quote('2', 'Oscar Wilde', 'I have nothing to declare except my genius'),
    Quote('3', 'Oscar Wilde', 'The truth is rarely pure and never simple'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Awesome Quotes'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 15,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  AddBook(
                      quoteInput,
                      (element) => {
                            setState(() => {
                                  quotes.add(Quote(
                                      new Random().nextInt(100).toString(),
                                      element,
                                      'Hello world')),
                                  quoteInput.clear()
                                })
                          })
                ],
              ),
            ),
            Positioned(
              top: 75,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: quotes
                      .map((quote) => QuoteCard(
                            quote,
                            (id) => {
                              setState(() => {
                                    quotes.removeWhere(
                                        (element) => element.id == id)
                                  })
                            },
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ));
  }
}
