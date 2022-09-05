// ignore_for_file: file_names

import 'package:app_tarkov/src/feature/ItemList.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  var searchText = 'default';
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Row(children: [
            Expanded(
                child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 0.5),
                ),
                hintText: 'Search an item',
              ),
              onChanged: (value) {
                searchText = value;
              },
              onSubmitted: (value) {
                setState(() {
                  searchText = value;
                });
              },
            )),
            Container(
                child: IconButton(
              onPressed: () {
                setState(() {
                  FocusScope.of(context).unfocus();
                });
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ))
          ])),
      searchText != ''
          ? ItemList(searchText: searchText)
          : Container(
              child: Text(
                'Waiting for search term.',
                style: TextStyle(color: Colors.white),
              ),
            )
    ]);
  }
}
