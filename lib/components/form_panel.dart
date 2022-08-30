import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:policesystem/components/signature_panel.dart';
import 'package:flutter/material.dart';

class FormPanel extends StatefulWidget {
  @override
  _FormPanelState createState() => _FormPanelState();
}

class _FormPanelState extends State<FormPanel> {
  final _formKey = GlobalKey<FormState>();
  final maskFormatter = MaskTextInputFormatter(mask: "+63 (###) ###-####");
  final maskFormatter2 = MaskTextInputFormatter(mask: "##-##-####");

  // String? _selectedValue = "Small";

  // String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  _FormPanelState() {
    // _barangayListSelected = _zoneListSelected;
    _zoneListSelected = zone[0];
    selectval = listitems[0];
  }
  String _zoneListSelected = " ";
  List<String> listitems = [
    'barangay 1',
    'barangay 2',
    'barangay 3',
    'barangay 4',
    'barangay 5',
    'barangay 6',
    'barangay 7',
    'barangay 8',
    'barangay 9',
    'barangay 10',
    'barangay 11',
    'barangay 12',
    'barangay 13',
    'barangay 14',
    'barangay 15',
    'barangay 16',
    'barangay 17',
    'barangay 18',
    'barangay 19',
    'barangay 20',
  ];
  String selectval = "Barangay";
  // String _barangayListSelected = " ";

  List<String> zone = [
    'Zone 1',
    'Zone 2',
    'Zone 3',
    'Zone 4',
    'Zone 5',
    'Zone 6',
    'Zone 7',
    'Zone 8',
    'Zone 9',
    'Zone 10',
    'Zone 11',
    'Zone 12',
    'Zone 13',
    'Zone 14',
    'Zone 15',
    'Zone 16',
    'Zone 17',
    'Zone 18',
    'Zone 19',
    'Zone 20',
  ];

  // var barangay = [
  // 'barangay 1',
  // 'barangay 2',
  // 'barangay 3',
  // 'barangay 4',
  // 'barangay 5',
  // 'barangay 6',
  // 'barangay 7',
  // 'barangay 8',
  // 'barangay 9',
  // 'barangay 10',
  // 'barangay 11',
  // 'barangay 12',
  // 'barangay 13',
  // 'barangay 14',
  // 'barangay 15',
  // 'barangay 16',
  // 'barangay 17',
  // 'barangay 18',
  // 'barangay 19',
  // 'barangay 20',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(221, 8, 45, 211),
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter Your Full Name",
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
                // DropdownButtonFormField(
                //     value: _zoneListSelected,
                //     items: zone
                //         .map((e) => DropdownMenuItem<String>(
                //               value: e,
                //               child: Text(e),
                //             ))
                //         .toList(),
                //     onChanged: (val) {
                //       setState(() {
                //         _zoneListSelected = val as String;
                //       });
                //     },
                //     icon: Icon(
                //       Icons.arrow_drop_down_circle,
                //       color: Color.fromARGB(176, 0, 65, 241),
                //     ),
                //     decoration: const InputDecoration(
                //       filled: true,
                //       fillColor: Color.fromARGB(255, 255, 255, 255),
                //       labelText: 'Zone',
                //       labelStyle:
                //           TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(
                //               color: Color.fromARGB(50, 0, 0, 0), width: 2)),
                //       focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(
                //               color: Color.fromARGB(218, 84, 152, 255),
                //               width: 2)),
                Align(
                  alignment: Alignment
                      .center, // Align however you like (i.e .centerRight, centerLeft)
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
                        value: _zoneListSelected,
                        onChanged: (val) {
                          setState(() {
                            _zoneListSelected = val.toString();
                          });
                        },
                        items: zone.map((itemoned) {
                          return DropdownMenuItem(
                              value: itemoned, child: Text(itemoned));
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: DropdownButton(
                        value: selectval,
                        onChanged: (value) {
                          setState(() {
                            selectval = value.toString();
                          });
                        },
                        items: listitems.map((itemone) {
                          return DropdownMenuItem(
                              value: itemone, child: Text(itemone));
                        }).toList(),
                      ),
                    )
                  ],
                ),

                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: "Enter Address",
                //   ),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "Input Your Address";
                //     } else {
                //       return null;
                //     }
                //   },
                // ),

                SizedBox(height: 16),
                TextFormField(
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
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Sex",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Gender";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Civil Status",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Civil Status";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nationality",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Nationality";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                  ),
                  inputFormatters: [maskFormatter],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Mobile Number";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Age",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Age";
                    } else {
                      return null;
                    }
                  },
                ),

                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Height",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Height";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
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
                ),

                SizedBox(height: 16),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(80, 50),
                      maximumSize: Size(80, 50),
                    ),
                    onPressed: () {
                      // else {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => SignaturePanel()));
                      // }
                    },
                    child: Text('Next')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
