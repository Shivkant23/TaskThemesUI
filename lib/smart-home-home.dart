import 'package:flutter/material.dart';

class SmartHome extends StatefulWidget {
  SmartHome({Key key}) : super(key: key);

  @override
  _SmartHomeState createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _heightController;
  Animation<double> _iconSizeController;

  @override
  void initState() {    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //  child: child,
    );
  }
}