import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:policesystem/components/form_panel.dart';
import 'package:policesystem/model/data_table_model.dart';
import 'package:desktop_window/desktop_window.dart';

class Pick_panel extends StatefulWidget {
  const Pick_panel({Key? key}) : super(key: key);

  @override
  State<Pick_panel> createState() => _PickPanel();
}

// @override
// Widget build(BuildContext context => Scaffold
// );
class _PickPanel extends State<Pick_panel> {
  late List<User> _users;
  late List<User> selectedUsers;

  late bool sort;

  @override
  void initState() {
    sort = false;
    _users = User.getUsers();
    selectedUsers = [];
    super.initState();
    testWindowSize();
  }

  testWindowSize() async {
    await DesktopWindow.setMaxWindowSize(const Size(1600, 900));
    await DesktopWindow.setMinWindowSize(const Size(1280, 720));
  }

  onSortColumn(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        _users.sort((a, b) => a.firstname.compareTo(b.firstname));
      } else {
        _users.sort((a, b) => b.firstname.compareTo(a.firstname));
      }
    }
  }

  onSelectedRow(bool selected, User _user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(_user);
      } else {
        selectedUsers.remove(_user);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for (User user in temp) {
          _users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: const Text("First Name"),
              numeric: false,
              tooltip: "This is the First Name",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColumn(columnIndex, ascending);
              }),
          const DataColumn(
            label: Text("Last Name"),
            numeric: false,
            tooltip: "This is the Last Name",
          ),
          const DataColumn(
            label: Text("Address"),
            numeric: false,
            tooltip: "This is the Last Name",
          ),
          const DataColumn(
            label: Text('Phone'),
            numeric: false,
            tooltip: "This is the Last Name",
          ),
          const DataColumn(
            label: Text("Birthday"),
            numeric: false,
            tooltip: "This is the Last Name",
          ),
          const DataColumn(
            label: Text("Height"),
            numeric: false,
            tooltip: "This is the Last Name",
          ),
          const DataColumn(
            label: Text("Birthplace"),
            numeric: false,
            tooltip: "This is the Last Name",
          ),
          const DataColumn(
            label: Text("Nationality"),
            numeric: false,
            tooltip: "This is the Last Name",
          ),
          const DataColumn(
            label: Text("Civil Status"),
            numeric: false,
            tooltip: "This is the Last Name",
          ),
          const DataColumn(
            label: Text("Delete"),
            tooltip: "This is the Delete Button",
          ),
          const DataColumn(
            label: Text("Edit"),
            tooltip: "This is the Edit Button",
          ),
        ],
        rows: _users
            .map(
              (user) => DataRow(
                  selected: selectedUsers.contains(user),
                  onSelectChanged: (b) {
                    print('Selected changed ');
                    onSelectedRow(b!, user);
                  },
                  cells: [
                    DataCell(
                      Text(user.firstname),
                    ),
                    DataCell(
                      Text(user.lastname),
                    ),
                    DataCell(
                      Text(user.Address),
                    ),
                    DataCell(
                      Text(user.Phone),
                    ),
                    DataCell(
                      Text(user.Birthday),
                    ),
                    DataCell(
                      Text(user.Height),
                    ),
                    DataCell(
                      Text(user.Birthplace),
                    ),
                    DataCell(
                      Text(user.Nationality),
                    ),
                    DataCell(
                      Text(user.CivilStatus),
                    ),
                    DataCell(
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // selectedUsers.isEmpty
                            //     ? null
                            //     : () {
                            deleteSelected();
                            // };
                          }),
                    ),
                    DataCell(
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            deleteSelected();
                            // };
                          }),
                    ),
                  ]),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User Profile'),
        leading: IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FormPanel()));
          },
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.logout),
            label: Text("Logout"),
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          TextFormField(
            initialValue: 'Input text',
            maxLength: 50,
            decoration: const InputDecoration(
              icon: Icon(Icons.search),
              labelText: 'Search',
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 0, 56, 238),
              ),
              helperText: 'Search Data',
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 56, 238)),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: dataBody(),
          ),
          // ),),
          // Card(
          // child:
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(140.0),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text('SELECTED ${selectedUsers.length}')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
