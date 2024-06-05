import 'package:book_lib_app/pages/detail_page/book_details_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../modal/BookList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var books = <Book>[];
  var filteredBooks = <Book>[];
  var isProgressShow = true;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    setState(() {
      isProgressShow = true;
    });

    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos'));
    if (response.statusCode == 200) {
      print("JBK --------${json.decode(response.body)}");
      setState(() {
        var bookList = BookList.fromJson(json.decode(response.body));
        books = bookList.book!;
        filteredBooks = books;
      });
      setState(() {
        isProgressShow = false;
      });
    } else {
      setState(() {
        isProgressShow = false;
      });

      throw Exception('Failed to load books');
    }
  }

  void filterBooks(String query) {
    final filtered = books.where((book) {
      final bookAuthor = book.title;
      final searchLower = query.toLowerCase();
      return bookAuthor!.contains(searchLower);
    }).toList();

    setState(() {
      filteredBooks = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Search'),
      ),
      body: isProgressShow
          ? Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ]),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Search by book or author',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: filterBooks,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredBooks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              child: Text(filteredBooks[index].title!)),
                        ),
                        //subtitle: Text(filteredBooks[index].albumId!.toString()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BookDetailsPage(book: filteredBooks[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
