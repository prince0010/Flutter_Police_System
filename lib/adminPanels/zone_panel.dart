// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// import 'package:policesystem/adminPanels/barangay_panel.dart';
// import 'package:policesystem/adminPanels/co_panel.dart';
// import 'package:policesystem/adminPanels/cr_panel.dart';
// import 'package:policesystem/adminPanels/police_panel.dart';
// import 'package:policesystem/adminPanels/pos_panel.dart';
// import 'package:policesystem/adminPanels/pur_panel.dart';
// import 'package:policesystem/adminPanels/rank_panel.dart';
// import 'package:policesystem/adminPanels/home_panel.dart';
// import 'package:policesystem/admin_component/list_view_component.dart';
// import 'package:policesystem/admin_component/floating_action_button_components.dart';
// import 'package:responsive_table/responsive_table.dart';

// class ZonePanel extends StatefulWidget {
//   const ZonePanel({Key? key}) : super(key: key);

//   @override
//   State<ZonePanel> createState() => _ZonePanelState();
// }

// class _ZonePanelState extends State<ZonePanel> {
//   final isDialOpen = ValueNotifier(false);

//   // _mockPullData() async {
//   //   _expanded = List.generate(_currentPerPage!, (index) => false);

//   //   setState(() => _isLoading = true);
//   //   Future.delayed(Duration(seconds: 3)).then((value) {
//   //     _sourceOriginal.clear();
//   //     _sourceOriginal.addAll(_generateData(n: random.nextInt(10000)));
//   //     _sourceFiltered = _sourceOriginal;
//   //     _total = _sourceFiltered.length;
//   //     _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
//   //     setState(() => _isLoading = false);
//   //   });
//   // }
//   late List<DatatableHeader> _headers;

//   List<int> _perPages = [10, 20, 50, 100];
//   int _total = 100;
//   int? _currentPerPage = 10; //default current Per Page
//   List<bool>? _expanded;
//   String? _searchKey = "id"; //searchkey == id

//   int _currentPage = 1;
//   bool _isSearch = false;
//   List<Map<String, dynamic>> _sourceOriginal = [];
//   List<Map<String, dynamic>> _sourceFiltered = [];
//   List<Map<String, dynamic>> _source = [];
//   List<Map<String, dynamic>> _selecteds = [];
//   // ignore: unused_field
//   String _selectableKey = "id";

//   String? _sortColumn;
//   bool _sortAscending = true;
//   bool _isLoading = true;
//   bool _showSelect = true; //select checkboxes
//   var random = new Random();
//   VoidCallback? onClicked;
//   List<Map<String, dynamic>> _generateData({int n: 100}) {
//     final List source = List.filled(n, Random.secure());
//     List<Map<String, dynamic>> temps = [];
//     var i = 1;
//     print(i);
//     // ignore: unused_local_variable
//     for (var data in source) {
//       temps.add({
//         "id": i,
//         "sku": "$i\000$i",
//         "name": "Product $i",
//         "category": "Category-$i",
//         "price": i * 10.00,
//         "cost": "20.00",
//         "margin": "${i}0.20",
//         "in_stock": "${i}0",
//         "alert": "5",
//         "received": [i + 20, 150]
//       });
//       i++;
//     }
//     return temps;
//   }

//   _initializeData() async {
//     _mockPullData();
//   }

//   _mockPullData() async {
//     _expanded = List.generate(_currentPerPage!, (index) => false);

//     setState(() => _isLoading = true);
//     Future.delayed(Duration(seconds: 3)).then((value) {
//       _sourceOriginal.clear();
//       _sourceOriginal.addAll(_generateData(n: random.nextInt(10000)));
//       _sourceFiltered = _sourceOriginal;
//       _total = _sourceFiltered.length;
//       _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
//       setState(() => _isLoading = false);
//     });
//   }

//   _resetData({start: 0}) async {
//     setState(() => _isLoading = true);
//     var _expandedLen =
//         _total - start < _currentPerPage! ? _total - start : _currentPerPage;
//     Future.delayed(Duration(seconds: 0)).then((value) {
//       _expanded = List.generate(_expandedLen as int, (index) => false);
//       _source.clear();
//       _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
//       setState(() => _isLoading = false);
//     });
//   }

//   _filterData(value) {
//     setState(() => _isLoading = true);

//     try {
//       if (value == "" || value == null) {
//         _sourceFiltered = _sourceOriginal;
//       } else {
//         _sourceFiltered = _sourceOriginal
//             .where((data) => data[_searchKey!]
//                 .toString()
//                 .toLowerCase()
//                 .contains(value.toString().toLowerCase()))
//             .toList();
//       }

//       _total = _sourceFiltered.length;
//       var _rangeTop = _total < _currentPerPage! ? _total : _currentPerPage!;
//       _expanded = List.generate(_rangeTop, (index) => false);
//       _source = _sourceFiltered.getRange(0, _rangeTop).toList();
//     } catch (e) {
//       print(e);
//     }
//     setState(() => _isLoading = false);
//   }

//   @override
//   void initState() {
//     super.initState();

//     /// set headers
//     _headers = [
//       DatatableHeader(
//           text: "First Name",
//           value: "id",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.center),
//       DatatableHeader(
//           text: "Middle Name",
//           value: "name",
//           show: true,
//           // flex: 2,
//           sortable: true,
//           editable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "Last Name",
//           value: "sku",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.center),
//       DatatableHeader(
//           text: "Username",
//           value: "category",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.center),
//       DatatableHeader(
//           text: "Zone",
//           value: "price",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.center),
//       // DatatableHeader(
//       //     text: "User Type",
//       //     value: "margin",
//       //     show: true,
//       //     sortable: true,
//       //     textAlign: TextAlign.center),
//       // DatatableHeader(
//       //     text: "Findings",
//       //     value: "in_stock",
//       //     show: true,
//       //     sortable: true,
//       //     textAlign: TextAlign.center),
//       // DatatableHeader(
//       //     text: "Status",
//       //     value: "alert",
//       //     show: true,
//       //     sortable: true,
//       //     textAlign: TextAlign.center),
//       DatatableHeader(
//           text: "Page",
//           value: "received",
//           show: true,
//           sortable: false,
//           sourceBuilder: (value, row) {
//             List list = List.from(value);
//             return Container(
//               child: Column(
//                 children: [
//                   Container(
//                     width: 85,
//                     child: LinearProgressIndicator(
//                       value: list.first / list.last,
//                     ),
//                   ),
//                   Text("${list.first} of ${list.last}")
//                 ],
//               ),
//             );
//           },
//           textAlign: TextAlign.center),
//     ];

//     _initializeData(); //para pag mag loading ata is ma apil ni ang mga data sa each datatablehead
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     onWillPop:
//     () async {
//       if (isDialOpen.value) {
//         //close speed dial
//         isDialOpen.value = false;

//         return false;
//       } else {
//         return true;
//       }
//     };
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Zone Table"),
//         actions: [
//           IconButton(
//             onPressed: () {}, // try to find the logout function in this one
//             icon: Icon(Icons.logout_rounded),
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         //====Navigation Bar====
//         child: List_view(),
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//             Container(
//               margin: EdgeInsets.all(10),
//               padding: EdgeInsets.all(0),
//               constraints: BoxConstraints(
//                 maxHeight: 700,
//               ),
//               child: Card(
//                 elevation: 1,
//                 shadowColor: Colors.black,
//                 clipBehavior: Clip.none,
//                 child: ResponsiveDatatable(
//                   title: TextButton.icon(
//                     onPressed: () => {},
//                     icon: Icon(
//                       Icons.table_chart,
//                       color: Colors.black,
//                     ),
//                     label: Text(
//                       "Data Table",
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   reponseScreenSizes: [ScreenSize.xs],
//                   actions: [
//                     if (_isSearch)
//                       Expanded(
//                           child: TextField(
//                         decoration: InputDecoration(
//                             hintText: 'Enter search term based on ' +
//                                 _searchKey!
//                                     .replaceAll(new RegExp('[\\W_]+'), ' ')
//                                     .toUpperCase(),
//                             prefixIcon: IconButton(
//                                 icon: Icon(Icons.cancel),
//                                 onPressed: () {
//                                   setState(() {
//                                     _isSearch = false;
//                                   });
//                                   //i reset ang mga researches pag i click ang cancel icon which is katong x na icon
//                                   _initializeData();
//                                 }),
//                             suffixIcon: IconButton(
//                                 icon: Icon(Icons.search), onPressed: () {})),
//                         onSubmitted: (value) {
//                           _filterData(value);
//                         },
//                       )),
//                     if (!_isSearch)
//                       IconButton(
//                           icon: Icon(Icons.search),
//                           onPressed: () {
//                             setState(() {
//                               _isSearch = true;
//                             });
//                           })
//                   ],
//                   headers: _headers,
//                   source: _source,
//                   selecteds: _selecteds,
//                   showSelect: _showSelect, //select checkboxes
//                   autoHeight: false,
//                   // dropContainer: (data) {
//                   //   if (int.tryParse(data['id'].toString())!.isEven) {
//                   //     return Text("is Even");
//                   //   }
//                   //   return _DropDownContainer(data: data);
//                   // },
//                   onChangedRow: (value, header) {
//                     /// print(value);
//                     /// print(header);
//                   },
//                   onSubmittedRow: (value, header) {
//                     /// print(value);
//                     /// print(header);
//                   },
//                   onTabRow: (data) {
//                     print(data);
//                   },
//                   //sorting on every dataheader
//                   onSort: (value) {
//                     setState(() => _isLoading = true);

//                     setState(() {
//                       _sortColumn = value;
//                       _sortAscending = !_sortAscending;
//                       if (_sortAscending) {
//                         _sourceFiltered.sort((a, b) =>
//                             b["$_sortColumn"].compareTo(a["$_sortColumn"]));
//                       } else {
//                         _sourceFiltered.sort((a, b) =>
//                             a["$_sortColumn"].compareTo(b["$_sortColumn"]));
//                       }
//                       var _rangeTop = _currentPerPage! < _sourceFiltered.length
//                           ? _currentPerPage!
//                           : _sourceFiltered.length;
//                       _source = _sourceFiltered.getRange(0, _rangeTop).toList();
//                       _searchKey = value;

//                       _isLoading = false;
//                     });
//                   },
//                   expanded: _expanded,
//                   sortAscending: _sortAscending,
//                   sortColumn: _sortColumn,
//                   isLoading: _isLoading,
//                   onSelect: (value, item) {
//                     print("$value  $item ");
//                     if (value!) {
//                       setState(() => _selecteds.add(item));
//                     } else {
//                       setState(
//                           () => _selecteds.removeAt(_selecteds.indexOf(item)));
//                     }
//                   },
//                   onSelectAll: (value) {
//                     if (value!) {
//                       setState(() => _selecteds =
//                           _source.map((entry) => entry).toList().cast());
//                     } else {
//                       setState(() => _selecteds.clear());
//                     }
//                   },
//                   // Pages below 1-10 etc.
//                   footers: [
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                       child: Text("Rows per page:"),
//                     ),
//                     if (_perPages.isNotEmpty)
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 15),
//                         child: DropdownButton<int>(
//                           value: _currentPerPage,
//                           items: _perPages
//                               .map((e) => DropdownMenuItem<int>(
//                                     child: Text("$e"),
//                                     value: e,
//                                   ))
//                               .toList(),
//                           onChanged: (dynamic value) {
//                             setState(() {
//                               _currentPerPage = value;
//                               _currentPage = 1;
//                               _resetData();
//                             });
//                           },
//                           isExpanded: false,
//                         ),
//                       ),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                       child:
//                           Text("$_currentPage - $_currentPerPage of $_total"),
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         size: 16,
//                       ),
//                       onPressed: _currentPage == 1
//                           ? null
//                           : () {
//                               var _nextSet = _currentPage - _currentPerPage!;
//                               setState(() {
//                                 _currentPage = _nextSet > 1 ? _nextSet : 1;
//                                 _resetData(start: _currentPage - 1);
//                               });
//                             },
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.arrow_forward_ios, size: 16),
//                       onPressed: _currentPage + _currentPerPage! - 1 > _total
//                           ? null
//                           : () {
//                               var _nextSet = _currentPage + _currentPerPage!;

//                               setState(() {
//                                 _currentPage = _nextSet < _total
//                                     ? _nextSet
//                                     : _total - _currentPerPage!;
//                                 _resetData(start: _nextSet - 1);
//                               });
//                             },
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                     )
//                   ],
//                   headerDecoration: BoxDecoration(
//                       color: Colors.grey,
//                       border: Border(
//                           bottom: BorderSide(color: Colors.red, width: 1))),
//                   selectedDecoration: BoxDecoration(
//                     border: Border(
//                         bottom:
//                             BorderSide(color: Colors.green[300]!, width: 1)),
//                     color: Colors.green,
//                   ),
//                   headerTextStyle: TextStyle(color: Colors.white),
//                   rowTextStyle: TextStyle(color: Colors.green),
//                   selectedTextStyle: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ])),
//       //================FLOATING BAR===================
//       floatingActionButton: Speed_Dial(),
//       //================!/FLOATING BAR===================
//     );
//   }
// }

// class _DropDownContainer extends StatelessWidget {
//   final Map<String, dynamic> data;
//   const _DropDownContainer({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _children = data.entries.map<Widget>((entry) {
//       Widget w = Row(
//         children: [
//           Text(entry.key.toString()),
//           Spacer(),
//           Text(entry.value.toString()),
//         ],
//       );
//       return w;
//     }).toList();

//     return Container(
//       /// height: 100,
//       child: Column(
//         /// children: [
//         ///   Expanded(
//         ///       child: Container(
//         ///     color: Colors.red,
//         ///     height: 50,
//         ///   )),
//         /// ],
//         children: _children,
//       ),
//     );
//   }
// }

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

class ZonePanel extends StatefulWidget {
  const ZonePanel({Key? key}) : super(key: key);

  @override
  State<ZonePanel> createState() => _ZonePanelState();
}

testWindowSize() async {
  await DesktopWindow.setMaxWindowSize(const Size(1600, 900));
  await DesktopWindow.setMinWindowSize(const Size(1280, 720));
}

class _ZonePanelState extends State<ZonePanel> {
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
          title: Text("Zone Page"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.login_rounded),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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

            //============Set up the filter section
            const Divider(
              color: Color.fromARGB(66, 204, 247, 255),
              indent: 20.0,
              endIndent: 10.0,
              thickness: 2,
            ),
            Card(
              color: Color.fromARGB(246, 232, 235, 238),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   data['location'],
                  //   style: TextStyle(
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
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
                      SizedBox(
                        width: 40.0,
                      ),
                    ],
                  ),
                ],
              ),
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
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DataTable(
                                headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Color.fromARGB(209, 23, 41, 146),
                                ),

                                columns: const [
                                  DataColumn(
                                      label: Text(
                                    'ID',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'First Name',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Middle Name',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Last Name',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Contact Number',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Username',
                                    style: TextStyle(color: Colors.white),
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
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                          DataCell(Container(
                                            width: 100,
                                            child: Text(
                                              user.first_name,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                          DataCell(Container(
                                            width: 100,
                                            child: Text(
                                              user.middle_name,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                          DataCell(Container(
                                            width: 100,
                                            child: Text(
                                              user.last_name,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                          DataCell(Container(
                                            width: 100,
                                            child: Text(
                                              user.contact_no,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                          DataCell(Container(
                                            width: 100,
                                            child: Text(
                                              user.username,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ))
                                        ]))
                                    .toList(),
                                showBottomBorder: true,
                              ),
                            ],
                          ));
                    } else {
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
                  } else {
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
