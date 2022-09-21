import 'dart:convert';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:policesystem/admin_component/list_view_component.dart';
import 'package:policesystem/api/user_data_table_api.dart';
import 'package:policesystem/model/home_model.dart';
import 'package:http/http.dart' as http;
import '../Floating Action Button/floating_action_button_components.dart';

class UserPanel extends StatefulWidget {
  const UserPanel({Key? key}) : super(key: key);

  @override
  State<UserPanel> createState() => _UserPanelState();
}

testWindowSize() async {
  await DesktopWindow.setMaxWindowSize(const Size(1600, 900));
  await DesktopWindow.setMinWindowSize(const Size(1280, 720));
}

class _UserPanelState extends State<UserPanel> {
  bool isloading = false;
  // Map data = {};
  // Object? parameters;
  //floating action button
  final isDialOpen = ValueNotifier(false);
  String? _searchKey = "Last Name";
  // final Future<List<User>> _func = fetchUsers();

  @override
  void initState() {
    super.initState();
    this.fetchUser();
    // ascending = false;
    testWindowSize();
    Future<List<User>> _func = fetchUserist();
    // print(_func);
  }

  List user = [];
  fetchUser() async {
    setState(() {
      isloading = true;
    });
    var url = "http://127.0.0.1:8000/api/police";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        user = items;
        isloading = false;
      });
    } else {
      setState(() {
        user = [];
        isloading = false;
      });
    }
  }

  Widget getCard(index) {
    var fullName = index['first_name'] +
        " " +
        index["middle_name"] +
        " " +
        index["last_name"];
    var position = index['position_id'];

    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 40.0, //kani
            ),
            child: Flexible(
              child: Card(
                child: ListTile(
                  title: Row(children: <Widget>[
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(186, 96, 221, 243),
                        borderRadius: BorderRadius.circular(60 / 2),
                        image: new DecorationImage(
                          image: new AssetImage("assets/police-logo.jpeg"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              child: Text(
                            fullName.toString(),
                            style: TextStyle(fontSize: 17),
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            position.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 143, 143, 143)),
                          ),
                        ]),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    if (user.contains(null) || user.length < 0 || isloading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(
            Color.fromARGB(186, 96, 221, 243)),
      ));
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            Container(
                // padding: EdgeInsets.only(right: 1380.0, bottom: 14.0),
                padding: EdgeInsets.only(bottom: 14.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                      child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        size: 23.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("Dashboard", style: TextStyle(fontSize: 23.0))
                    ],
                  )),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 103, 171, 248),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8.0))),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 30.0,
                      left: 50.0,
                      right: 50.0,
                      top: 40.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.people,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              "Users",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15.0,
                          height: 32.0,
                        ),
                        const Text(
                          "Total Users",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 228, 228, 228)),
                        ),
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(192, 255, 160, 105),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8.0))),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 30.0,
                      left: 50.0,
                      right: 50.0,
                      top: 40.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.people,
                              size: 30.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              "Users",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15.0,
                          height: 32.0,
                        ),
                        const Text(
                          "Ehh",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 57, 216, 163),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8.0))),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 30.0,
                      left: 50.0,
                      right: 50.0,
                      top: 40.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.people,
                              size: 30.0,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              "Total Users",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15.0,
                          height: 32.0,
                        ),
                        const Text(
                          "69",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 60.0,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 750.0, top: 15.0, bottom: 15.0),
                      child: Row(
                        children: [
                          Text(
                            "Police",
                            style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Icon(Icons.local_police_outlined, color: Colors.blue),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: user.length,
                          itemBuilder: ((context, index) {
                            return getCard(user[index]);
                          })),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //floating action button
    onWillPop:
    () async {
      if (isDialOpen.value) {
        //close speed dial
        isDialOpen.value = false;

        return false;
      } else {
        return true;
      }
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.login_rounded),
            ),
          ],
        ),
        body: getBody(),

        //this is first container

        drawer: Drawer(
          //====Navigation Bar====
          child: List_view(),
        ),
        floatingActionButton: Speed_Dial(),
      ),
    );
    // return widget
  }
}
