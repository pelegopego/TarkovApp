// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'ItemScreen.dart';
import 'components/appBar.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  static const routeName = '/Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Container(
            color: Colors.blueGrey[900],
            padding: EdgeInsets.all(10),
            child: ItemScreen()));
  }
}
