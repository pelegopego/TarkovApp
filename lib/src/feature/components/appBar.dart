// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(95.0),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  // ignore: library_private_types_in_public_api
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blueGrey[700],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 5, right: 5),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Column(children: [
                  Row(children: [
                    const Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                            left: 30,
                          ),
                          child: Text(
                            'Tarkov App',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Comfortaa',
                                fontSize: 16),
                          )),
                    ),
                  ]),
                ]),
              ),
            ],
          ),
        ));
  }
}
