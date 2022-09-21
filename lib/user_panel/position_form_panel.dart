import 'dart:convert';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../adminPanels/pos_panel.dart';
import 'co_form_model.dart';
import 'position_form_model.dart';
import 'rank_form_model.dart';

class positionPanel extends StatefulWidget {
  @override
  _positionPanelState createState() => _positionPanelState();
}

class _positionPanelState extends State<positionPanel> {
  final TextEditingController _rankcontroller = TextEditingController();
  Future<Position>? _futureAlbum;
  final _formKey = GlobalKey<FormState>();

  List categoryItemList = [];
  List cateogoryBarangayList = [];

// ===================================== Start API CALL for zone ==========================================================

  // var map = new Map<String, dynamic>();
  // map['name'] = rankController;

  // final response = await http.post(
  //   Uri.parse('http://127.0.0.1:8000/api/ranks'),
  //   body: map,
  // );

  // print(response.body);

  final rankController = TextEditingController();
// =====================================End API CALL for zone ==========================================================
  testWindowSize() async {
    await DesktopWindow.setMaxWindowSize(const Size(1600, 900));
    await DesktopWindow.setMinWindowSize(const Size(1280, 720));
  }

// ===================================== Start API CALL for Barangay ==========================================================

// =====================================End API CALL for barangay ==========================================================

  @override
  void initState() {
    super.initState();

    testWindowSize();
  }

  // List of items in our dropdown menu
  Future<Position> createAlbum(String name) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/positions'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Position.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Add Positions.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Positions',
        ),
        foregroundColor: Color.fromARGB(221, 0, 0, 0),
        backgroundColor: Color.fromARGB(221, 230, 230, 230),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 40, right: 40),
        child: SingleChildScrollView(
          //Scroll
          child: Form(
            key: _formKey, //Formid pag html
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 16),
                const Align(
                  alignment: Alignment
                      .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                  child: Text(
                    'Add Positions',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
                TextFormField(
                  controller: _rankcontroller,
                  decoration: const InputDecoration(
                    labelText: "Positions",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Input Positions";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(80, 50),
                      maximumSize: Size(80, 50),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _futureAlbum = createAlbum(_rankcontroller.text);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Pospanel()));
                      }

                      // else {
                      //
                      // }
                    },
                    child: Text('Add')),
                // GestureDetector(
                //   onTap: (() {
                //     add();
                //   }),
                //   child: Container(
                //     height: 80,
                //     width: 80,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Color(0xFF363f93),
                //     ),
                //     child: Icon(
                //       Icons.arrow_forward,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
