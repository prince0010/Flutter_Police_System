import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateBtn extends StatelessWidget {
  const UpdateBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Data',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
