// import 'package:flutter/material.dart';
// import 'package:policesystem/pages/api.dart';
// import 'package:policesystem/pages/logins.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';


// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   String username = '';

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   _loadUserData() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     // var username = jsonDecode(localStorage.getString('username'));

//     if (username != null) {
//       setState(() {
//         // username = username['username'];
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff151515),
//       appBar: AppBar(
//         title: Text('Home'),
//         backgroundColor: Color(0xff151515),
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.power_settings_new),
//             onPressed: () {
//               logout();
//             },
//           )
//         ],
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(15),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     'Hello, ',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   Text(
//                     '${username}',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void logout() async {
//     var res = await Network().getData('/logout');
//     var body = json.decode(res.body);
//     if (body['success']) {
//       SharedPreferences localStorage = await SharedPreferences.getInstance();
//       localStorage.remove('user');
//       localStorage.remove('token');
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => Login()));
//     }
//   }
// }
