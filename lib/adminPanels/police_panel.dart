// import 'dart:convert';

// import 'package:desktop_window/desktop_window.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// import 'package:intl/intl.dart';
// import 'package:policesystem/adminPanels/barangay_panel.dart';
// import 'package:policesystem/adminPanels/co_panel.dart';
// import 'package:policesystem/adminPanels/cr_panel.dart';
// import 'package:policesystem/adminPanels/police_panel.dart';
// import 'package:policesystem/adminPanels/pos_panel.dart';
// import 'package:policesystem/adminPanels/pur_panel.dart';
// import 'package:policesystem/adminPanels/rank_panel.dart';
// import 'package:policesystem/adminPanels/zone_panel.dart';
// import 'package:policesystem/admin_api/police_api.dart';
// import 'package:policesystem/admin_component/list_view_component.dart';
// import 'package:policesystem/admin_model/police_model.dart';
// import 'package:policesystem/api/user_data_table_api.dart';
// import 'package:policesystem/admin_component/floating_action_button_components.dart';
// import 'package:policesystem/components/user_panel_data_rows_components.dart';
// import 'package:policesystem/model/user_model.dart';

// class Policepanel extends StatefulWidget {
//   const Policepanel({Key? key}) : super(key: key);

//   @override
//   State<Policepanel> createState() => _PolicepanelState();
// }

// testWindowSize() async {
//   await DesktopWindow.setMaxWindowSize(const Size(1600, 900));
//   await DesktopWindow.setMinWindowSize(const Size(1280, 720));
// }

// class _PolicepanelState extends State<Policepanel> {
//   // Map data = {};
//   // Object? parameters;
//   final isDialOpen = ValueNotifier(false);

//   // final Future<List<User>> _func = fetchUsers();

//   @override
//   void initState() {
//     super.initState();
//     // ascending = false;
//     testWindowSize();
//     Future<List<Police>> _func = fetchPolice();
//     // print(_func);
//   }

//   // void _getData() async {
//   //   cities = await loadCatelog();
//   // }

//   // _initializeData() async {
//   //   // _mockPullData();\
//   //   _func = fetchUsers();
//   // }

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

//   @override
//   Widget build(BuildContext context) {
//     // DataRow _getDataRow(index, data) {
//     //   return DataRow(
//     //     cells: <DataCell>[
//     //       DataCell(Text(data['id'])), //add name of your columns here
//     //       DataCell(Text(data['first_name'])),
//     //       DataCell(Text(data['middle_name'])),
//     //       DataCell(Text(data['last_name'])),
//     //       DataCell(Text(data['contact_no'])),
//     //       DataCell(Text(data['username'])),
//     //       DataCell(Text(data['roles'])),
//     //     ],
//     //   );
//     // }
//     // print(fetchUsers());

//     DateTime now = DateTime.now();
//     String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

//     // parameters = ModalRoute.of(context)!.settings.arguments;
//     // Map data = jsonDecode(jsonEncode(parameters));
//     // print(data);

//     //floating action button
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
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("HOME PANEL"),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.login_rounded),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//             SizedBox(
//               height: 20.0,
//             ),
//             //============Set up the filter section
//             const Divider(
//               color: Color.fromARGB(66, 133, 133, 133),
//               indent: 20.0,
//               endIndent: 10.0,
//               thickness: 2,
//             ),
//             Card(
//               margin: EdgeInsets.all(15),
//               elevation: 18.0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10.0))),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(15),
//                       child: TextButton.icon(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.watch_later_rounded,
//                           color: Colors.deepPurple.shade400,
//                         ),
//                         label: Text(
//                           "${formattedDate}",
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.deepPurple.shade400,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         DropdownButton(
//                           hint: Text("Filter by: "),
//                           items: [
//                             DropdownMenuItem(
//                               child: Text('Time'),
//                               value: "qwe",
//                             ),
//                             DropdownMenuItem(
//                               child: Text('Date'),
//                               value: "qwe",
//                             ),
//                             DropdownMenuItem(
//                               child: Text('Name'),
//                               value: "qwe",
//                             ),
//                             DropdownMenuItem(
//                               child: Text('Year'),
//                               value: "qwe",
//                             ),
//                           ],
//                           onChanged: (val) {},
//                         ),
//                         SizedBox(
//                           width: 40.0,
//                         ),
//                         DropdownButton(
//                           hint: Text("Order by: "),
//                           items: [
//                             DropdownMenuItem(
//                               child: Text('Time'),
//                               value: "qwe",
//                             ),
//                             DropdownMenuItem(
//                               child: Text('Date'),
//                               value: "qwe",
//                             ),
//                             DropdownMenuItem(
//                               child: Text('Name'),
//                               value: "qwe",
//                             ),
//                             DropdownMenuItem(
//                               child: Text('Year'),
//                               value: "qwe",
//                             ),
//                           ],
//                           onChanged: (val) {},
//                         ),
//                         SizedBox(
//                           width: 30.0,
//                         ),
//                       ],
//                     ),
//                   ]),
//             ),

//             SizedBox(
//               height: 30.0,
//             ),
//             //Data table =========================

//             Container(
//               child: Card(
//                 child: FutureBuilder<List<Police>>(
//                   future: fetchPolice(),
//                   builder: (context, snapshot) {
//                     print(snapshot);
//                     if (snapshot.hasData) {
//                       // print(fetchUsers());
//                       List<Police>? data = snapshot.data;
//                       // print(data);

//                       if (data != null) {
//                         return Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 DataTable(
//                                   headingRowColor:
//                                       MaterialStateColor.resolveWith(
//                                     (states) =>
//                                         Color.fromARGB(209, 119, 119, 119),
//                                   ),

//                                   columns: [
//                                     DataColumn(
//                                         label: Text(
//                                       'ID',
//                                       style: TextStyle(color: Colors.white),
//                                     )),
//                                     DataColumn(
//                                         label: Text(
//                                       'First Name',
//                                       style: TextStyle(color: Colors.white),
//                                     )),
//                                     DataColumn(
//                                         label: Text(
//                                       'Middle Name',
//                                       style: TextStyle(color: Colors.white),
//                                     )),
//                                     DataColumn(
//                                         label: Text(
//                                       'Last Name',
//                                       style: TextStyle(color: Colors.white),
//                                     )),
//                                     DataColumn(
//                                         label: Text(
//                                       'Contact Number',
//                                       style: TextStyle(color: Colors.white),
//                                     )),
//                                     DataColumn(
//                                         label: Text(
//                                       'Contact Number',
//                                       style: TextStyle(color: Colors.white),
//                                     )),
//                                   ],
//                                   // rows: List.generate(
//                                   //   results.length,
//                                   //   (index) => _getDataRow(
//                                   //     index,
//                                   //     results[index],
//                                   //   ),
//                                   // ),
//                                   rows: data
//                                       .map((user) => DataRow(cells: [
//                                             DataCell(Container(
//                                               width: 100,
//                                               child: Text(
//                                                 user.id.toString(),
//                                                 softWrap: true,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               ),
//                                             )),
//                                             DataCell(Container(
//                                               width: 100,
//                                               child: Text(
//                                                 user.first_name,
//                                                 softWrap: true,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               ),
//                                             )),
//                                             DataCell(Container(
//                                               width: 100,
//                                               child: Text(
//                                                 user.middle_name,
//                                                 softWrap: true,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               ),
//                                             )),
//                                             DataCell(Container(
//                                               width: 100,
//                                               child: Text(
//                                                 user.last_name,
//                                                 softWrap: true,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               ),
//                                             )),
//                                             DataCell(Container(
//                                               width: 100,
//                                               child: Text(
//                                                 user.contact_no,
//                                                 softWrap: true,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               ),
//                                             )),
//                                             DataCell(Container(
//                                               width: 100,
//                                               child: Text(
//                                                 user.contact_no,
//                                                 softWrap: true,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               ),
//                                             ))
//                                           ]))
//                                       .toList(),
//                                   showBottomBorder: true,
//                                 ),
//                               ],
//                             ));
//                       } else {
//                         return Row(
//                           children: <Widget>[
//                             SizedBox(
//                               // ignore: sort_child_properties_last
//                               child: CircularProgressIndicator(),
//                               width: 30,
//                               height: 30,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(40),
//                               child: Text('2'),
//                               // child: Text('No Data Found...'),
//                             ),
//                           ],
//                         );
//                       }
//                     } else {
//                       return Row(
//                         children: <Widget>[
//                           SizedBox(
//                             // ignore: sort_child_properties_last
//                             child: CircularProgressIndicator(),
//                             width: 30,
//                             height: 30,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(40),
//                             child: Text('1'),
//                             // child: Text('No Data Found...'),
//                           ),
//                         ],
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),

//             SizedBox(
//               height: 20.0,
//             ),
//             Row(
//               children: [
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "1",
//                     style: TextStyle(color: Colors.deepPurple),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "2",
//                     style: TextStyle(color: Colors.deepPurple),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "3",
//                     style: TextStyle(color: Colors.deepPurple),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "See All",
//                     style: TextStyle(color: Colors.deepPurple),
//                   ),
//                 ),
//               ],
//             ),
//           ]),
//         ),
//         drawer: Drawer(
//           //====Navigation Bar====
//           child: List_view(),
//         ),
//         floatingActionButton: Speed_Dial(),
//       ),
//     );
//     // return widget
//   }
// }
//lahi=============================
import 'package:flutter/material.dart';
import 'package:policesystem/admin_api/police_api.dart';
import 'package:policesystem/admin_model/police_model.dart';

class Policepanel extends StatefulWidget {
  const Policepanel({Key? key}) : super(key: key);

  @override
  _PolicepanelState createState() => _PolicepanelState();
}

class _PolicepanelState extends State<Policepanel> {
  @override
  Widget build(BuildContext context) {
    final BuildContext context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Police Tables'),
        backgroundColor: Color.fromARGB(255, 18, 79, 103),
      ),
      body: FutureBuilder(
        future: fetchPolice(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                PaginatedDataTable(
                  source: dataSource(snapshot.data),
                  header: Text(
                    'Police Data Table',
                  ),
                  rowsPerPage: 10,
                  columns: [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('First Name')),
                    DataColumn(label: Text('Middle Name')),
                    DataColumn(label: Text('Last Name')),
                    DataColumn(label: Text('Contact Number')),
                  ],
                  showCheckboxColumn: true,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  DataTableSource dataSource(List<Police> policeList) =>
      MyData(dataList: policeList);
}

class MyData extends DataTableSource {
  MyData({required this.dataList});
  late final List<Police> dataList;
  int _selectedCount = 0;

  // late List<Police> _rows;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => dataList.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= dataList.length) return null;
    final row = dataList[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      //  return DataRow(
      cells: [
        DataCell(
          Text(dataList[index].id.toString()),
        ),
        DataCell(
          Text(dataList[index].first_name),
        ),
        DataCell(
          Text(dataList[index].middle_name),
        ),
        DataCell(
          Text(dataList[index].last_name),
        ),
        DataCell(
          Text(dataList[index].contact_no),
        ),
      ],
    );
  }

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: _shrineColorScheme,
      // accentColor: shrineBrown900,
      primaryColor: shrinePink100,
      // buttonColor: shrinePink100,
      scaffoldBackgroundColor: shrineBackgroundWhite,
      cardColor: shrineBackgroundWhite,
      // textSelectionColor: shrinePink100,
      errorColor: shrineErrorRed,
      buttonTheme: const ButtonThemeData(
        colorScheme: _shrineColorScheme,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: _customIconTheme(base.iconTheme),
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      // accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      iconTheme: _customIconTheme(base.iconTheme),
    );
  }

  IconThemeData _customIconTheme(IconThemeData original) {
    return original.copyWith(color: shrineBrown900);
  }

  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          caption: base.caption?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: defaultLetterSpacing,
          ),
          button: base.button?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: defaultLetterSpacing,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: shrineBrown900,
          bodyColor: shrineBrown900,
        );
  }
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  // primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  // secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;



// class _DataSource extends DataTableSource {
//   _DataSource(this.context) {
//     _rows = <_Row>[
//       _Row('Cell A1', 'CellB1', 'CellC1', 1),
//       _Row('Cell A2', 'CellB2', 'CellC2', 2),
//       _Row('Cell A3', 'CellB3', 'CellC3', 3),
//       _Row('Cell A4', 'CellB4', 'CellC4', 4),
//     ];
//   }

// final BuildContext context;

//   @override
//   int get rowCount => _rows.length;

//   @override
//   bool get isRowCountApproximate => false;


// }

