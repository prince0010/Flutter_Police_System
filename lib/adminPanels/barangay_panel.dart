import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:policesystem/adminPanels/co_panel.dart';
import 'package:policesystem/adminPanels/cr_panel.dart';
import 'package:policesystem/adminPanels/police_panel.dart';
import 'package:policesystem/adminPanels/pos_panel.dart';
import 'package:policesystem/adminPanels/pur_panel.dart';
import 'package:policesystem/adminPanels/rank_panel.dart';
import 'package:policesystem/adminPanels/user_panel.dart';
import 'package:policesystem/adminPanels/zone_panel.dart';
import 'package:policesystem/component/admin_datatable_components.dart';
import 'package:policesystem/component/floating_action_button_components.dart';
import 'package:policesystem/component/list_view_component.dart';

class BarangayPanel extends StatefulWidget {
  const BarangayPanel({Key? key}) : super(key: key);

  @override
  State<BarangayPanel> createState() => _BarangayPanelState();
}

class _BarangayPanelState extends State<BarangayPanel> {
  _initializeData() async {
    // _mockPullData();
  }

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("BARANGAY PANEL"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout_rounded),
            ),
          ],
        ),
        drawer: Drawer(
          //====Navigation Bar====
          child: List_view(),
        ),
        //floating action button
        floatingActionButton: Speed_Dial(),
      ),
    );
  }
}
