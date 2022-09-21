// import 'package:flutter/material.dart';
// import 'package:policesystem/adminPanels/user_panel.dart';

// class Users {
//   final int id;
//   final String first_name;
//   final String middle_name;
//   final String last_name;
//   final String contact_no;
//   final String username;

//   const Users(
//     this.id,
//     this.first_name,
//     this.middle_name,
//     this.last_name,
//     this.contact_no,
//     this.username,
//   );

//   DataRow getRow(
//     SelectedCallBack callback,
//     List<String> selectedIds,
//   ) {
//     return DataRow(
//       cells: [
//         DataCell(Text(id.toString())),
//         DataCell(Text(first_name)),
//         DataCell(Text(middle_name)),
//         DataCell(Text(last_name)),
//         DataCell(Text(contact_no)),
//         DataCell(Text(username)),
//       ],
//       onSelectChanged: (newState) {
//         callback(id.toString(), newState ?? false);
//       },
//       selected: selectedIds.contains(id.toString()),
//     );
//   }

//   factory Users.fromJson(Map<String, dynamic> json) {
//     return Users(
//       json['id'] as int,
//       json['first_name'] as String,
//       json['middle_name'] as String,
//       json['last_name'] as String,
//       json['contact_no'] as String,
//       json['username'] as String,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'first_name': first_name,
//       'middle_name': middle_name,
//       'last_name': last_name,
//       'contact_no': contact_no,
//       'username': username,
//     };
//   }
// }
