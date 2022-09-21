import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../user_panel/police_form_panel.dart';

class PoliceFloat extends StatefulWidget {
  @override
  State<PoliceFloat> createState() => _PoliceFloatState();
}

class _PoliceFloatState extends State<PoliceFloat> {
  final isDialOpen = ValueNotifier(false);

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
    return SpeedDial(
      overlayColor: Colors.black,
      overlayOpacity: 0.4,
      spacing: 12,
      icon: Icons.share,
      spaceBetweenChildren: 12,
      closeManually:
          false, // This is for floating action button if manag click sa childer mu close siya
      openCloseDial: isDialOpen,
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
            child: Icon(Icons.add),
            label: 'Add Police User',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PoliceForm()));
            },
            backgroundColor: Colors.orange),
        // onTap: () => {},
        SpeedDialChild(
            child: Icon(Icons.info_outline),
            label: 'Information',
            backgroundColor: Colors.greenAccent),
      ],
    );
  }
}
