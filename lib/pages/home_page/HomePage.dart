import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:book_lib_app/constant/app_strings.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(AppStrings.SEARCH_BOOK),
            TextField(
              controller:searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: searchBook(searchController.value.text),
              
            )
            ListView(
              children: [],
            )
            
            
            
            
            ],
        ),
      ),
    );
  }
  
   searchBook(String searchText) {


  }
}
