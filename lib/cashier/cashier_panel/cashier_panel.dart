import 'package:flutter/material.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';
import 'package:policesystem/cashier/cashier_api/cashier_api.dart';
import 'package:policesystem/cashier/cashier_components/save_button.dart';
import 'package:policesystem/cashier/cashier_components/search_comp.dart';
import 'package:policesystem/cashier/cashier_model/cashier_model.dart';

class CashierPanel extends StatefulWidget {
  const CashierPanel({Key? key}) : super(key: key);

  @override
  _CashierPanelState createState() => _CashierPanelState();
}

class _CashierPanelState extends State<CashierPanel> {
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
          title: Text('Payment Table'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
          backgroundColor: Color.fromARGB(255, 18, 79, 103),
        ),
        body: FutureBuilder(
          future: fetchPayment(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  PaginatedSearchBar<Item>(
                    maxHeight: 400,
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

                        if (pageIndex == 0) {
                          pager = ItemPager();
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
                  SizedBox(
                    height: 30.0,
                  ),
                  PaginatedDataTable(
                    source: dataSource(snapshot.data),
                    header: Text(
                      'Payment Table',
                    ),
                    rowsPerPage: 10,
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('OR Number')),
                      // DataColumn(label: Text('Roles')),
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
        floatingActionButton: Confirm_Button(),
      ),
    );
  }

  DataTableSource dataSource(List<Payment> PaymentList) =>
      MyData(dataList: PaymentList);
}

class MyData extends DataTableSource {
  MyData({required this.dataList});
  late final List<Payment> dataList;
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
          Text(dataList[index].or_number),
        ),
        // DataCell(
        //   Text(dataList[index].roles.toString()),
        // ),
      ],
    );
  }
}
