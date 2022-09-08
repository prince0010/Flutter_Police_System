import 'package:flutter/material.dart';
import 'package:policesystem/admin_model/police_model.dart';

class UserDataTableSource extends DataTableSource {
  UserDataTableSource({
    required List<Police> userData,
    // required this.onRowSelect,
  })  : _userData = userData,
        assert(userData != null);

  final List<Police> _userData;
  // final OnRowSelect onRowSelect;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);

    if (index >= _userData.length) {
      return null;
    }
    final _user = _userData[index];

    return DataRow.byIndex(
      index: index, // DON'T MISS THIS
      cells: <DataCell>[
        DataCell(Text('${_user.id}')),
        DataCell(Text('${_user.first_name}')),
        DataCell(Text('${_user.middle_name}')),
        DataCell(Text('${_user.last_name}')),
        DataCell(Text('${_user.contact_no}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _userData.length;

  @override
  int get selectedRowCount => 0;
}
