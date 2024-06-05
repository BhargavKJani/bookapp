import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  final dynamic book;

  BookDetailsPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
                height:150,width:150,
                child: Image.network(book.thumbnailUrl)),
            SizedBox(height: 16),
            Text(
              book.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'by ${book.thumbnailUrl}',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(book.albumId.toString()),
          ],
        ),
      ),
    );
  }
}
