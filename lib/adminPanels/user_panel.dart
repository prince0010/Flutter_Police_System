// import 'package:advanced_datatable/advanced_datatable_source.dart';
// import 'package:advanced_datatable/datatable.dart';
// import 'package:flutter/material.dart';
// import 'package:policesystem/model/user_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'User Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);
//   final String? title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
//   final source = ExampleSource();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title!),
//       ),
//       body: SingleChildScrollView(
//         child: AdvancedPaginatedDataTable(
//           addEmptyRows: false,
//           source: source,
//           showFirstLastButtons: true,
//           rowsPerPage: rowsPerPage,
//           availableRowsPerPage: [1, 5, 10, 50],
//           onRowsPerPageChanged: (newRowsPerPage) {
//             if (newRowsPerPage != null) {
//               setState(() {
//                 rowsPerPage = newRowsPerPage;
//               });
//             }
//           },
//           columns: [
//             DataColumn(label: Text('ID')),
//             DataColumn(label: Text('First Name')),
//             DataColumn(label: Text('Last Name')),
//             DataColumn(label: Text('Contact Number')),
//             DataColumn(label: Text('Userame'))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RowData {
//   final int index;
//   final String value;

//   RowData(this.index, this.value);
// }

// class ExampleSource extends AdvancedDataTableSource<Users> {
//   final data =
//       List<Users>.generate(4, (id) => Users(index, 'Value for no. $id'));

//   @override
//   DataRow? getRow(int id) {
//     final currentRowData = lastDetails!.rows[id];
//     return DataRow(cells: [
//       DataCell(
//         Text(currentRowData.id.toString()),
//       ),
//       DataCell(
//         Text(currentRowData.first_name),
//       ),
//       DataCell(
//         Text(currentRowData.last_name),
//       ),
//       DataCell(
//         Text(currentRowData.contact_no),
//       ),
//       DataCell(
//         Text(currentRowData.username),
//       )
//     ]);
//   }

//   @override
//   int get selectedRowCount => 0;

//   @override
//   Future<RemoteDataSourceDetails<Users>> getNextPage(
//       NextPageRequest pageRequest) async {
//     return RemoteDataSourceDetails(
//       data.length,
//       data
//           .skip(pageRequest.offset)
//           .take(pageRequest.pageSize)
//           .toList(), //again in a real world example you would only get the right amount of rows
//     );
//   }
// }

// import 'package:advanced_datatable/advanced_datatable_source.dart';
// import 'package:advanced_datatable/datatable.dart';
// import 'package:flutter/material.dart';
// import 'package:policesystem/api/user_api.dart';
// import 'package:policesystem/model/user_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: DataPage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class DataPage extends StatefulWidget {
//   DataPage({Key? key, this.title}) : super(key: key);
//   final String? title;
//   @override
//   _DataPageState createState() => _DataPageState();
// }

// class _DataPageState extends State<DataPage> {
//   var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
//   final source = ExampleSource();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title!),
//       ),
//       body: FutureBuilder(
//         future: fetchPagedUsers(),
//         builder: (BuildContext ctx, AsyncSnapshot snapshot) {
//           print("1 parsing stuff");
//           try {
//             if (snapshot.hasData) {
//               return SingleChildScrollView(
//                 child: AdvancedPaginatedDataTable(
//                   addEmptyRows: false,
//                   source: source,
//                   showFirstLastButtons: true,
//                   rowsPerPage: rowsPerPage,
//                   availableRowsPerPage: [1, 5, 10, 50],
//                   onRowsPerPageChanged: (newRowsPerPage) {
//                     if (newRowsPerPage != null) {
//                       setState(() {
//                         rowsPerPage = newRowsPerPage;
//                       });
//                     }
//                   },
//                   columns: const [
//                     DataColumn(label: Text('ID')),
//                     DataColumn(label: Text('First Name')),
//                     DataColumn(label: Text('Middle Name')),
//                     DataColumn(label: Text('Last Name')),
//                     DataColumn(label: Text('Contact Number')),
//                     DataColumn(label: Text('Username'))
//                   ],
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }
//             return const CircularProgressIndicator();
//           } on Exception catch (_) {
//             print("throwing new error");
//             throw Exception("Error on server");
//           }
//         },
//       ),
//     );
//   }
// }

// // class RowData {
// //   final int id;
// //   final String value;

// //   RowData(this.id, this.value);
// // }

// class ExampleSource extends AdvancedDataTableSource<Users> {
//   @override
//   DataRow? getRow(int index) {
//     final currentRowData = lastDetails!.rows[index];
//     return DataRow(cells: [
//       DataCell(
//         Text(currentRowData.id.toString()),
//       ),
//       DataCell(
//         Text(currentRowData.first_name),
//       ),
//       DataCell(
//         Text(currentRowData.middle_name),
//       ),
//       DataCell(
//         Text(currentRowData.last_name),
//       ),
//       DataCell(
//         Text(currentRowData.contact_no),
//       ),
//       DataCell(
//         Text(currentRowData.username),
//       ),
//     ]);
//   }

//   @override
//   int get selectedRowCount => 0;

//   @override
//   Future<RemoteDataSourceDetails<Users>> getNextPage(
//       NextPageRequest pageRequest) {
//     throw UnimplementedError();
//   }

// @override
// Future<RemoteDataSourceDetails<Users>> getNextPage(
//     NextPageRequest pageRequest) async {
//   return RemoteDataSourceDetails(
// data.length,
// data
//     .skip(pageRequest.offset)
//     .take(pageRequest.pageSize)
//     .toList(), //again in a real world example you would only get the right amount of rows
// data.length,
// (data.length as List<dynamic>)
//     .map((e) => Users.fromPagedJson(e))
//     .toList(),
//   );
// }
// }
// }

import 'package:flutter/material.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';
import 'package:policesystem/admin_component/list_view_component.dart';
import 'package:policesystem/api/user_api.dart';
import 'package:policesystem/cashier/cashier_components/search_comp.dart';
import 'package:policesystem/model/user_model.dart';

import '../Floating Action Button/floating_action_button_components.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
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
          title: Text('User Table'),

          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
          backgroundColor: Color.fromARGB(255, 18, 79, 103),
        ),
        body: FutureBuilder(
          future: fetchPagedUsers(),
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
                    header: const Text(
                      'User Data Table',
                    ),
                    rowsPerPage: rowsPerPage,
                    showFirstLastButtons: true,
                    availableRowsPerPage: [1, 5, 10, 50],
                    onRowsPerPageChanged: (newRowsPerPage) {
                      if (newRowsPerPage != null) {
                        setState(() {
                          rowsPerPage = newRowsPerPage;
                        });
                      }
                    },
                    columns: const [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('First Name')),
                      DataColumn(label: Text('Middle Name')),
                      DataColumn(label: Text('Last Name')),
                      DataColumn(label: Text('Contact Number')),
                      DataColumn(label: Text('Username')),
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
        floatingActionButton: Speed_Dial(),
      ),
    );
  }

  DataTableSource dataSource(List<Users> policeList) =>
      MyData(dataList: policeList);
}

class MyData extends DataTableSource {
  MyData({required this.dataList});
  late final List<Users> dataList;
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
          Text(dataList[index].first_name),
        ),
        DataCell(
          Text(dataList[index].middle_name),
        ),
        DataCell(
          Text(dataList[index].last_name),
        ),
        DataCell(
          Text(dataList[index].contact_no),
        ),
        DataCell(
          Text(dataList[index].username),
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
