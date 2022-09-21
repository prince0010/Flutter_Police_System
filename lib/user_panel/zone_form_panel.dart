import 'dart:convert';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:policesystem/adminPanels/zone_panel.dart';

import 'cr_form_model.dart';

class zonePanel extends StatefulWidget {
  @override
  _zonePanelState createState() => _zonePanelState();
}

class _zonePanelState extends State<zonePanel> {
  final TextEditingController _fncontroller = TextEditingController();
  final TextEditingController _mncontroller = TextEditingController();
  final TextEditingController _lncontroller = TextEditingController();
  final TextEditingController _zonecontroller = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(mask: "+63 (###) ###-####");
  final maskFormatter2 = MaskTextInputFormatter(mask: "##-##-####");
  final heightFormatter = MaskTextInputFormatter(mask: "#'##");
  List categoryItemList = [];
  List cateogoryBarangayList = [];
  Future<CR>? _futureAlbum;
  final _formKey = GlobalKey<FormState>();

  Future getAllCategory() async {
    var baseURL = 'http://127.0.0.1:8000/api/zones';

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

  Future getAllBarangay() async {
    var baseurl = 'http://127.0.0.1:8000/api/barangays';

    http.Response resp1 = await http.get(Uri.parse(baseurl));
    if (resp1.statusCode == 200) {
      var jsonData = json.decode(resp1.body);
      setState(() {
        cateogoryBarangayList = jsonData;
      });
    }
  }

// =====================================End API CALL for zone ==========================================================

// ===================================== Start API CALL for Barangay ==========================================================

// =====================================End API CALL for barangay ==========================================================

  @override
  void initState() {
    super.initState();
    getAllCategory();
    getAllBarangay();
    testWindowSize();
  }

  // List of items in our dropdown menu
  Future<CR> createAlbum(String firstname, String middlename, String lastname,
      String zones) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/applicants'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'first_name': firstname,
        'middle_name': middlename,
        'last_name': lastname,
        'zones': zones,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return CR.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to add Zone');
    }
  }

  _zonePanelState() {
    // _barangayListSelected = _zoneListSelected;
    selectcs = civilStatus[0];
    selectsex = sex[0];
  }

  String selectsex = "";
  List<String> sex = ['Male', 'Female'];

  String selectcs = " ";
  List<String> civilStatus = [
    'Single',
    'Married',
    'Widow',
    'Widower',
    'Legally Separated'
  ];
  var dropdownvalue;
  var dropdownvalues;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Criminal Record',
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
                    'Add Criminal Record',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
                TextFormField(
                  controller: _fncontroller,
                  decoration: const InputDecoration(
                    labelText: "First Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Input First Name";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _mncontroller,
                  decoration: const InputDecoration(
                    labelText: "Middle Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Input Middle Name";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _lncontroller,
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Input Last Name";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _zonecontroller,
                  decoration: InputDecoration(
                    labelText: "Zone",
                  ),
                  inputFormatters: [maskFormatter2],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Zone";
                    } else {
                      return null;
                    }
                  },
                ),
                Align(
                  alignment: Alignment
                      .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                  child: Text(
                    'Address',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
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
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Align(
                      alignment: Alignment
                          .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                      child: Text(
                        'Place of Birth',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    )),
                    SizedBox(width: 40),
                    Expanded(
                        child: Align(
                      alignment: Alignment
                          .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                      child: Text(
                        'Date of Birth',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    )),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Place of Birth",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Place of Birth";
                        } else {
                          return null;
                        }
                      },
                    )),
                    SizedBox(width: 40),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Date of Birth (Month-Day-Year)",
                      ),
                      inputFormatters: [maskFormatter2],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Birthday";
                        } else {
                          return null;
                        }
                      },
                    ))
                  ],
                ),

                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Align(
                      alignment: Alignment
                          .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                      child: Text(
                        'Sex',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    )),
                    SizedBox(width: 40),
                    Expanded(
                        child: Align(
                      alignment: Alignment
                          .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                      child: Text(
                        'Civil Status',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: DropdownButton(
                      value: selectsex,
                      onChanged: (newvalue) {
                        setState(() {
                          selectsex = newvalue.toString();
                          print(newvalue);
                        });
                      },
                      items: sex.map((itemgen) {
                        return DropdownMenuItem(
                            value: itemgen, child: Text(itemgen));
                      }).toList(),
                    )),
                    SizedBox(width: 40),
                    Expanded(
                        child: DropdownButton(
                      value: selectcs,
                      onChanged: (value) {
                        setState(() {
                          selectcs = value.toString();
                        });
                      },
                      items: civilStatus.map((itemone) {
                        return DropdownMenuItem(
                            value: itemone, child: Text(itemone));
                      }).toList(),
                    )),
                  ],
                ),

                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Align(
                      alignment: Alignment
                          .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                      child: Text(
                        'Nationality',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    )),
                    SizedBox(width: 40),
                    Expanded(
                        child: Align(
                      alignment: Alignment
                          .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                      child: Text(
                        'Height',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nationality",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Nationality";
                        } else {
                          return null;
                        }
                      },
                    )),
                    SizedBox(width: 40),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Height",
                      ),
                      inputFormatters: [heightFormatter],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Height";
                        } else {
                          return null;
                        }
                      },
                    ))
                  ],
                ),

                SizedBox(height: 16),
                Align(
                  alignment: Alignment
                      .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                  child: Text(
                    'Contact Number',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Contact Number",
                  ),
                  inputFormatters: [maskFormatter],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Contact Number";
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
                        _futureAlbum = createAlbum(
                            _fncontroller.text,
                            _mncontroller.text,
                            _lncontroller.text,
                            _zonecontroller.text);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ZonePanel()));
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
