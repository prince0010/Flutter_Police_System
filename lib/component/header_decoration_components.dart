import 'package:flutter/material.dart';

class headerdec extends StatefulWidget {
  @override
  State<headerdec> createState() => _headerdecState();
}

class _headerdecState extends State<headerdec> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text("User"),
    );
  }
}
