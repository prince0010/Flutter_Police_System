import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:policesystem/adminPanels/barangay_panel.dart';
import 'package:policesystem/adminPanels/co_panel.dart';
import 'package:policesystem/adminPanels/cr_panel.dart';
import 'package:policesystem/adminPanels/pos_panel.dart';
import 'package:policesystem/adminPanels/pur_panel.dart';
import 'package:policesystem/adminPanels/rank_panel.dart';
import 'package:policesystem/adminPanels/user_panel.dart';
import 'package:policesystem/adminPanels/zone_panel.dart';
import 'package:policesystem/component/admin_datatable_components.dart';
import 'package:policesystem/component/floating_action_button_components.dart';
import 'package:policesystem/component/list_view_component.dart';

class Policepanel extends StatefulWidget {
  const Policepanel({Key? key}) : super(key: key);

  @override
  State<Policepanel> createState() => _PolicepanelState();
}

class _PolicepanelState extends State<Policepanel> {
  final isDialOpen = ValueNotifier(false);
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
          title: Text("POLICE PANEL"),
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
        floatingActionButton: Speed_Dial(),
      ),
    );
  }
}
