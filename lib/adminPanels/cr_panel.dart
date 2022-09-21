import 'package:flutter/material.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';
import 'package:policesystem/admin_component/list_view_component.dart';
import 'package:policesystem/api/cr_panel_api.dart';
import 'package:policesystem/cashier/cashier_components/search_comp.dart';
import 'package:policesystem/model/cr_model.dart';

import '../Floating Action Button/criminal_records_floating_action_button_comp.dart';

class CrPanel extends StatefulWidget {
  const CrPanel({Key? key}) : super(key: key);

  @override
  _CrPanelState createState() => _CrPanelState();
}

class _CrPanelState extends State<CrPanel> {
  var rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  final isDialOpen = ValueNotifier(false);
  ItemPager pager = ItemPager();
  @override
  Widget build(BuildContext context) {
    //floating action button
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
    //======
    final BuildContext context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Criminal Records Table'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
          backgroundColor: Color.fromARGB(255, 18, 79, 103),
        ),
        body: FutureBuilder(
          future: fetchCr(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  PaginatedSearchBar<Item>(
                    maxHeight: 30,
                    hintText: 'Search',
                    onSearch: ({
                      required pageIndex,
                      required pageSize,
                      required searchQuery,
                    }) async {
                      return Future.delayed(const Duration(milliseconds: 1300),
                          () {
                        if (searchQuery == "empty") {
                          return [];
                        }

                        return pager.next();
                      });
                    },
                    itemBuilder: (
                      context, {
                      required item,
                      required index,
                    }) {
                      return Text(item.title);
                    },
                  ),
                  PaginatedDataTable(
                    source: dataSource(snapshot.data),
                    header: Text(
                      'Criminal Records Table',
                    ),
                    rowsPerPage: rowsPerPage,
                    showFirstLastButtons: true,
                    availableRowsPerPage: [1, 5, 10, 30, 50],
                    onRowsPerPageChanged: (newRowsPerPage) {
                      if (newRowsPerPage != null) {
                        setState(() {
                          rowsPerPage = newRowsPerPage;
                        });
                      }
                    },
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('First Name')),
                      DataColumn(label: Text('Middle Name')),
                      DataColumn(label: Text('Last Name')),
                      // DataColumn(label: Text('Date of Birth')),
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
        drawer: Drawer(
          //====Navigation Bar====
          child: List_view(),
        ),
        floatingActionButton: Speed_Dial6(),
      ),
    );
  }

  DataTableSource dataSource(List<Cr> crList) => MyData(crdataList: crList);
}

class MyData extends DataTableSource {
  MyData({required this.crdataList});
  late final List<Cr> crdataList;
  //pagination
  int _selectedCount = 0;

  // late List<Police> _rows;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => crdataList.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= crdataList.length) return null;
    final row = crdataList[index];
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
          Text(crdataList[index].id.toString()),
        ),
        DataCell(
          Text(crdataList[index].first_name),
        ),
        DataCell(
          Text(crdataList[index].middle_name),
        ),
        DataCell(
          Text(crdataList[index].last_name),
        ),
        // DataCell(
        //   Text(crdataList[index].date_of_birth),
        // ),
      ],
    );
  }
}
