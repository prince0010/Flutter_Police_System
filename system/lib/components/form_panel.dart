import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:system/components/signature_panel.dart';

class FormPanel extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final maskFormatter = MaskTextInputFormatter(mask: "+63 (###) ###-####");
  final maskFormatter2 = MaskTextInputFormatter(mask: "##-##-####");
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    String name = "";
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(221, 8, 45, 211),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: new SingleChildScrollView(
          //Scroll
          child: Form(
            key: formKey, //Formid pag html
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter Address",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Input Your Address";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Date of Birth",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Birthday";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Date of Birth",
                  ),
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
                      minimumSize: const Size(80, 50),
                      maximumSize: const Size(80, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignaturePanel()));
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
