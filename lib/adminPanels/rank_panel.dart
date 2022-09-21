import 'package:flutter/material.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';
import 'package:policesystem/admin_component/list_view_component.dart';
import 'package:policesystem/api/rank_panel_api.dart';
import 'package:policesystem/cashier/cashier_components/search_comp.dart';
import 'package:policesystem/model/ranks_model.dart';

import '../Floating Action Button/rank_floating_action_button_components.dart';

class Rankpanel extends StatefulWidget {
  const Rankpanel({Key? key}) : super(key: key);

  @override
  _RankpanelState createState() => _RankpanelState();
}

class _RankpanelState extends State<Rankpanel> {
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
          title: Text('Rank Table'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.login_rounded),
            ),
          ],
          backgroundColor: Color.fromARGB(255, 18, 79, 103),
        ),
        body: FutureBuilder(
          future: fetchRanks(),
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
                      'Rank Table',
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
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text(' '))
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
        floatingActionButton: Speed_Dial3(),
      ),
    );
  }

  DataTableSource dataSource(List<Ranks> rankList) =>
      MyData(dataList: rankList);
}

class MyData extends DataTableSource {
  MyData({required this.dataList});
  late final List<Ranks> dataList;
  int _selectedCount = 0;

  // late List<Police> _rows;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => dataList.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= dataList.length) return null;
    final row = dataList[index];
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
          Text(dataList[index].id.toString()),
        ),
        DataCell(
          Text(dataList[index].name),
        ),
        DataCell(
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
