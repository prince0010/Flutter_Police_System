import 'dart:convert';

import 'package:desktop_window/desktop_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:policesystem/panel/signature_panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../panel/admin_signature_panel.dart';
import '../panel/police_signature_panel.dart';

class PoliceForm extends StatefulWidget {
  @override
  _PoliceFormState createState() => _PoliceFormState();
}

class _PoliceFormState extends State<PoliceForm> {
  final _formKey = GlobalKey<FormState>();

  List categoryItemList = [];
  List cateogoryBarangayList = [];
// ===================================== Start API CALL for zone ==========================================================
  Future getAllPositions() async {
    var baseURL = 'http://127.0.0.1:8000/api/positions';

    http.Response response = await http.get(Uri.parse(baseURL));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemList = jsonData;
      });
    }
  }

// =====================================End API CALL for zone ==========================================================
  testWindowSize() async {
    await DesktopWindow.setMaxWindowSize(const Size(1600, 900));
    await DesktopWindow.setMinWindowSize(const Size(1280, 720));
  }
// ===================================== Start API CALL for Barangay ==========================================================

  Future getAllRanks() async {
    var baseurl = 'http://127.0.0.1:8000/api/ranks';

    http.Response resp1 = await http.get(Uri.parse(baseurl));
    if (resp1.statusCode == 200) {
      var jsonData = json.decode(resp1.body);
      setState(() {
        cateogoryBarangayList = jsonData;
      });
    }
  }

// =====================================End API CALL for barangay ==========================================================

  @override
  void initState() {
    super.initState();
    getAllPositions();
    getAllRanks();
    testWindowSize();
  }

  // List of items in our dropdown menu

  var dropdownvalue;
  var dropdownvalues;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Police User',
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
                    'Full Name',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter First Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Input Your Full Name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter Middle Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Input Your Middle Name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter Your Last Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Input Your Full Name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Align(
                      alignment: Alignment
                          .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                      child: Text(
                        'Position',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      width: 710.0,
                    ),
                    Align(
                      alignment: Alignment
                          .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                      child: Text(
                        'Rank',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: DropdownButton(
                        // value: _myState,
                        // onChanged: (String val) {
                        //   // setState(() {
                        //   //   _myState = val;
                        //   //   _getZoneList;
                        //   //   print(_myState);
                        //   // });
                        // },
                        items: categoryItemList.map((itemoned) {
                          return DropdownMenuItem(
                              value: itemoned['id'],
                              child: Text(itemoned['name'].toString()));
                        }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            dropdownvalue = newvalue;
                            print(newvalue);
                          });
                        },
                        value: dropdownvalue,
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: DropdownButton(
                        // value: _myState,
                        // onChanged: (String val) {
                        //   // setState(() {
                        //   //   _myState = val;
                        //   //   _getZoneList;
                        //   //   print(_myState);
                        //   // });
                        // },
                        items: cateogoryBarangayList.map((items) {
                          return DropdownMenuItem(
                              value: items['id'],
                              child: Text(items['name'].toString()));
                        }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            dropdownvalues = newvalue;
                            print(dropdownvalues);
                          });
                        },
                        value: dropdownvalues,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),
                // ,

                SizedBox(height: 16),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(80, 50),
                      maximumSize: Size(80, 50),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PoliceSignaturePanel()));
                      }
                      // else {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => SignaturePanel()));
                      // }
                    },
                    child: Text('Next')),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
