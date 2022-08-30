import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system/Model/userModel.dart';
import 'package:system/components/pick_panel.dart';
import 'package:http/http.dart' as http;
import 'package:system/services/userService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  // final UserService userService = const UserService();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List bottomNavTitles = ["Home", "Location", "Stuff"];
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> login() async {
    var response = await http
        .post(Uri.parse("http://127.0.0.1:8000/api/auth/login"), body: {
      "username": username.text,
      "password": password.text,
    });
    // var data = json.decode(response.body);
    // if (data == "loggedin") {
    //   Navigator.push(
    //       cont, MaterialPageRoute(builder: (context) => Pick_panel()));
    // }
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Pick_panel()));
    } else {
      print("ERROR");
    }
  }

  // late Future<UserModel> user;
  // late UserService userService = const UserService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // user =
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          Expanded(
            flex: 2, // sa image na flex space ani sa login page
            child: Container(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/background.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(172, 73, 173, 255),
                          Color.fromARGB(122, 68, 137, 255),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 15),
                            Text(
                              "El Salvador Misamis Oriental",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, //para mag line ang circle na avatar og ang el salvador city na text
                          children: [
                            Text(
                              "Police Clearance Issuance System",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 26.5,
                              ),
                            ),
                            //space
                            const SizedBox(height: 16),
                            //space
                            Container(
                              // padding: EdgeInsets.symmetric(
                              //   vertical: 3.0,
                              //   horizontal: 5.0,
                              padding: EdgeInsets.all(4), //padding sa container
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 5),
                                      blurRadius: 5,
                                      color: Color.fromARGB(111, 0, 0, 0),
                                    ),
                                  ],
                                  color: const Color.fromARGB(255, 9, 45, 73),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, //i set ang width sa katng sa box decoration na color black na i set sa same width ato na container
                                children: [
                                  const CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(190, 1, 65, 117),
                                    maxRadius: 18,
                                    child: Icon(
                                      Icons.local_police,
                                      color: Colors.white,
                                      size: 18.0,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    "Police Station",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 8.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          // color: Colors.red,
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween, or
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: bottomNavTitles
                                .map(
                                  (e) => Text(
                                    e,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), //padding sa mga InputDecoration/TextFields
              color: Color.fromARGB(52, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: username,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      prefixIcon: const Icon(
                        FontAwesomeIcons.user,
                        size: 13.0,
                        color: Color.fromARGB(96, 255, 255, 255),
                      ),
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(96, 255, 255, 255),
                        fontSize: 13.0,
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextField(
                    controller: password,
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      prefixIcon: const Icon(
                        FontAwesomeIcons.lock,
                        size: 13.0,
                        color: Color.fromARGB(96, 255, 255, 255),
                      ),
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(96, 255, 255, 255),
                        fontSize: 13.0,
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(16.0),
                          ),
                          onPressed: () {
                            login();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Pick_panel()));
                            // login(context);
                            //when we press this button we want to navigate to the pick_panel screen
                            // if (userService.login(
                            //         username.text, password.text) ==
                            //     true) {
                            //   print("Login success");
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => Pick_panel()));
                            // } else {
                            //   print("error");
                            // }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 12.0),
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
