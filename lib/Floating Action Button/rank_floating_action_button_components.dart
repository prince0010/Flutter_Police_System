import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../user_panel/rank_form_panel.dart';

class Speed_Dial3 extends StatefulWidget {
  @override
  State<Speed_Dial3> createState() => _Speed_Dial3State();
}

class _Speed_Dial3State extends State<Speed_Dial3> {
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
            label: 'Add Rank',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => rankFormPanel()));
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
