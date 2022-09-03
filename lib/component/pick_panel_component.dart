// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:policesystem/components/form_panel.dart';
// import 'package:policesystem/model/pick_panel_model.dart';
// import 'package:desktop_window/desktop_window.dart';

// SingleChildScrollView dataBody() {
//   ;
//   return SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     // child: FittedBox(),
//     child: DataTable(
//       horizontalMargin: 0,
//       columnSpacing: 10,
//       //   horizontalMargin: 0, columnSpacing: 10, pampawala sa overflow sa kaning data table
//       // sortAscending: sort,
//       // sortColumnIndex: 0,
//       columns: [
//         DataColumn(
//           label: const Text("First Name"),
//           numeric: false,
//           tooltip: "This is the First Name",
//         ),
//         const DataColumn(
//           label: Text("Middle Name"),
//           numeric: false,
//           tooltip: "This is the Middle Name",
//         ),
//         const DataColumn(
//           label: Text("Last Name"),
//           numeric: false,
//           tooltip: "This is the Last Name",
//         ),
//         const DataColumn(
//           label: Text('Contact Num.'),
//           numeric: false,
//           tooltip: "This is the Contact Number",
//         ),
//         const DataColumn(
//           label: Text("Date of Birth"),
//           numeric: false,
//           tooltip: "This is the Date of Birth",
//         ),
//         const DataColumn(
//           label: Text("Place of Birth"),
//           numeric: false,
//           tooltip: "This is the Place of Birth",
//         ),
//         const DataColumn(
//           label: Text("Civil Status"),
//           numeric: false,
//           tooltip: "This is the Civil Status",
//         ),
//         const DataColumn(
//           label: Text("Height"),
//           numeric: false,
//           tooltip: "This is the Height",
//         ),
//         const DataColumn(
//           label: Text("Sex"),
//           numeric: false,
//           tooltip: "Your Gender",
//         ),
//         const DataColumn(
//           label: Text("Nationality"),
//           numeric: false,
//           tooltip: "This is the Last Name",
//         ),
//         const DataColumn(
//           label: Text("Address"),
//           numeric: false,
//           tooltip: "This is the Address",
//         ),
//         const DataColumn(
//           label: Text("Delete"),
//           tooltip: "This is the Delete Button",
//         ),
//         const DataColumn(
//           label: Text("Edit"),
//           tooltip: "This is the Edit Button",
//         ),
//       ], rows: _user.map(val) => DataRow( cells: [
//                     DataCell(
//                       Text(user.firstname),
//                     ),
//                     DataCell(
//                       Text(user.middlename),
//                     ),
//                     DataCell(
//                       Text(user.lastname),
//                     ),
//                     DataCell(
//                       Text(user.contact_no),
//                     ),
//                     DataCell(
//                       Text(user.date_of_birth),
//                     ),
//                     DataCell(
//                       Text(user.place_of_birth),
//                     ),
//                     DataCell(
//                       Text(user.civil_status),
//                     ),
//                     DataCell(
//                       Text(user.height),
//                     ),
//                     DataCell(
//                       Text(user.sex),
//                     ),
//                     DataCell(
//                       Text(user.nationality),
//                     ),
//                     DataCell(
//                       Text(user.address),
//                     ), ),
//     ),
//   );
// }
