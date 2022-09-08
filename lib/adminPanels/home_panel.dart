import 'dart:convert';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:policesystem/adminPanels/barangay_panel.dart';
import 'package:policesystem/adminPanels/co_panel.dart';
import 'package:policesystem/adminPanels/cr_panel.dart';
import 'package:policesystem/adminPanels/police_panel.dart';
import 'package:policesystem/adminPanels/pos_panel.dart';
import 'package:policesystem/adminPanels/pur_panel.dart';
import 'package:policesystem/adminPanels/rank_panel.dart';
import 'package:policesystem/adminPanels/zone_panel.dart';
import 'package:policesystem/admin_component/list_view_component.dart';
import 'package:policesystem/api/user_data_table_api.dart';
import 'package:policesystem/admin_component/floating_action_button_components.dart';
import 'package:policesystem/components/user_panel_data_rows_components.dart';
import 'package:policesystem/model/user_model.dart';

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
  // Map data = {};
  // Object? parameters;
  //floating action button
  final isDialOpen = ValueNotifier(false);

  // final Future<List<User>> _func = fetchUsers();

  @override
  void initState() {
    super.initState();
    // ascending = false;
    testWindowSize();
    Future<List<User>> _func = fetchUsers();
    // print(_func);
  }

  // void _getData() async {
  //   cities = await loadCatelog();
  // }

  // _initializeData() async {
  //   // _mockPullData();\
  //   _func = fetchUsers();
  // }

  // _mockPullData() async {
  //   _expanded = List.generate(_currentPerPage!, (index) => false);

  //   setState(() => _isLoading = true);
  //   Future.delayed(Duration(seconds: 3)).then((value) {
  //     _sourceOriginal.clear();
  //     _sourceOriginal.addAll(_generateData(n: random.nextInt(10000)));
  //     _sourceFiltered = _sourceOriginal;
  //     _total = _sourceFiltered.length;
  //     _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
  //     setState(() => _isLoading = false);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // DataRow _getDataRow(index, data) {
    //   return DataRow(
    //     cells: <DataCell>[
    //       DataCell(Text(data['id'])), //add name of your columns here
    //       DataCell(Text(data['first_name'])),
    //       DataCell(Text(data['middle_name'])),
    //       DataCell(Text(data['last_name'])),
    //       DataCell(Text(data['contact_no'])),
    //       DataCell(Text(data['username'])),
    //       DataCell(Text(data['roles'])),
    //     ],
    //   );
    // }
    // print(fetchUsers());

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    // parameters = ModalRoute.of(context)!.settings.arguments;
    // Map data = jsonDecode(jsonEncode(parameters));
    // print(data);

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
          title: Text("HOME PANEL"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.login_rounded),
            ),
          ],
        ),
        body: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.people,
                                          size: 30.0,
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Text(
                                          "Users",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
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
                                          color:
                                              Color.fromARGB(255, 83, 163, 87)),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                            Flexible(
                                child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.article,
                                          size: 30.0,
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Text(
                                          "Number 2",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                      height: 32.0,
                                    ),
                                    Text(
                                      "Ehh",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 233, 157, 57)),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                            Flexible(
                                child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.article,
                                          size: 30.0,
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Text(
                                          "Number 3",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                      height: 32.0,
                                    ),
                                    Text(
                                      "sheeesshh",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 233, 157, 57)),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                        //======= something section==============
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Divider(
                          color: Color.fromARGB(66, 133, 133, 133),
                          indent: 20.0,
                          endIndent: 10.0,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 100.0),
                                  child: Text(
                                    "Home Records",
                                    style: TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 80.0),
                                  child: Text(
                                    "9,000,000,000",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 500.0,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search the Name",
                                  prefixIcon: Icon(
                                    Icons.search,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        //============Set up the filter section
                        const Divider(
                          color: Color.fromARGB(66, 133, 133, 133),
                          indent: 20.0,
                          endIndent: 10.0,
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(
                            //   data['location'],
                            //   style: TextStyle(
                            //     fontSize: 20.0,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),

                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.watch_later_rounded,
                                color: Colors.deepPurple.shade400,
                              ),
                              label: Text(
                                "${formattedDate}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.deepPurple.shade400,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                DropdownButton(
                                  hint: Text("Filter by: "),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('Time'),
                                      value: "qwe",
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Date'),
                                      value: "qwe",
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Name'),
                                      value: "qwe",
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Year'),
                                      value: "qwe",
                                    ),
                                  ],
                                  onChanged: (val) {},
                                ),
                                SizedBox(
                                  width: 40.0,
                                ),
                                DropdownButton(
                                  hint: Text("Order by: "),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('Time'),
                                      value: "qwe",
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Date'),
                                      value: "qwe",
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Name'),
                                      value: "qwe",
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Year'),
                                      value: "qwe",
                                    ),
                                  ],
                                  onChanged: (val) {},
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        //Data table =========================
                               Container(
                                child: FutureBuilder<List<User>>(
                               future: fetchUsers(),
                               builder: (context, snapshot) {
                              print(snapshot);
                              if (snapshot.hasData) {
                                // print(fetchUsers());
                                List<User>? data = snapshot.data;
                                // print(data);
                                if (data != null) {
                                  return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          DataTable(
                                            headingRowColor:
                                                MaterialStateColor.resolveWith(
                                              (states) => Color.fromARGB(
                                                  209, 23, 41, 146),
                                            ),

                                            columns: const [
                                              DataColumn(
                                                  label: Text(
                                                'ID',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'First Name',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Middle Name',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Last Name',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Contact Number',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Username',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            ],
                                            // rows: List.generate(
                                            //   results.length,
                                            //   (index) => _getDataRow(
                                            //     index,
                                            //     results[index],
                                            //   ),
                                            // ),
                                            rows: data
                                                .map((user) => DataRow(cells: [
                                                      DataCell(Container(
                                                        width: 100,
                                                        child: Text(
                                                          user.id.toString(),
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      )),
                                                      DataCell(Container(
                                                        width: 100,
                                                        child: Text(
                                                          user.first_name,
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      )),
                                                      DataCell(Container(
                                                        width: 100,
                                                        child: Text(
                                                          user.middle_name,
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      )),
                                                      DataCell(Container(
                                                        width: 100,
                                                        child: Text(
                                                          user.last_name,
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      )),
                                                      DataCell(Container(
                                                        width: 100,
                                                        child: Text(
                                                          user.contact_no,
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      )),
                                                      DataCell(Container(
                                                        width: 100,
                                                        child: Text(
                                                          user.username,
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ))
                                                    ]))
                                                .toList(),
                                            showBottomBorder: true,
                                          ),
                                        ],
                                      ));
                                      }     else {
                                     return Row(
                                    children: <Widget>[
                                      SizedBox(
                                        // ignore: sort_child_properties_last
                                        child: CircularProgressIndicator(),
                                        width: 30,
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(40),
                                        child: Text('2'),
                                        // child: Text('No Data Found...'),
                                      ),
                                    ],
                                  );
                                   }
                              }     else {
                                    return Row(
                                  children: <Widget>[
                                    SizedBox(
                                      // ignore: sort_child_properties_last
                                      child: CircularProgressIndicator(),
                                      width: 30,
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(40),
                                      child: Text('1'),
                                      // child: Text('No Data Found...'),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.stretch,
                        //   children: [
                        //     DataTable(
                        //       columns: [
                        //         DataColumn(label: Text("Id")),
                        //         DataColumn(label: Text("First name")),
                        //         DataColumn(label: Text("Middle name")),
                        //         DataColumn(label: Text("Last name")),
                        //         DataColumn(label: Text("Date")),
                        //         DataColumn(label: Text("Contact Number")),
                        //         DataColumn(label: Text("Username")),
                        //         DataColumn(label: Text("Role")),
                        //       ],
                        //       headingRowColor:
                        //           MaterialStateProperty.resolveWith(
                        //               (states) => Colors.grey.shade200),
                        //       rows: [
                        //         DataRow(
                        //           cells: [
                        //             DataCell(Text("01")),
                        //             DataCell(Text("Prince")),
                        //             DataCell(Text("Oro")),
                        //             DataCell(Text("Nagac")),
                        //             DataCell(Text("${formattedDate}")),
                        //             DataCell(Text(
                        //                 "983, Zone 2 Kauswagan Cagayan De Oro City")),
                        //             DataCell(Text("0392424324")),
                        //             DataCell(Text("USer")),
                        //           ],
                        //         )
                        //       ],
                        //     )

                        //     //naa dari ang mga data table og rows naa sa components
                        //   ],
                        // ),
                        //set the Pagination
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "1",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "2",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "3",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See All",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
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
