import 'package:flutter/material.dart';
import 'widgets/widgetHome.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return new _Home();
  }
}


class _Home extends State<Home> {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      body: new HomeWidget()
    );
  }
}