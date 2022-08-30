import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system/components/form_panel.dart';

class Pick_panel extends StatefulWidget {
  const Pick_panel({Key? key}) : super(key: key);

  @override
  State<Pick_panel> createState() => _PickPanel();
}

class _PickPanel extends State<Pick_panel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/1519189070.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: Color.fromARGB(221, 42, 108, 231),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome! ",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "Please Pick between these two buttons",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 13.0,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 65, 187, 243),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(20.0),
                          ),
                          onPressed: () {
                            //when we press this button we want to navigate to the pick_panel screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FormPanel()));
                          },
                          child: Text(
                            "Fillup Certificate",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 65, 187, 243),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(20.0),
                          ),
                          onPressed: () {
                            //when we press this button we want to navigate to the pick_panel screen
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Pick_panel()));
                          },
                          child: Text(
                            "Re-New Certificate",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
