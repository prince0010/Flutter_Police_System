import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignaturePanel extends StatefulWidget {
  @override
  State<SignaturePanel> createState() => _SignaturePanel();
}

class _SignaturePanel extends State<SignaturePanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color.fromARGB(213, 0, 25, 138), // red as border color
            ),
            borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
