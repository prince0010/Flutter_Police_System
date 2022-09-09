import 'package:flutter/material.dart';
import 'package:policesystem/admin_component/floating_action_button_components.dart';
import 'package:policesystem/admin_component/list_view_component.dart';
import 'package:policesystem/api/user_api.dart';
import 'package:policesystem/model/user_model.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final isDialOpen = ValueNotifier(false);

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
          title: Text('User Tables'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.login_rounded),
            ),
          ],
          backgroundColor: Color.fromARGB(255, 18, 79, 103),
        ),
        body: FutureBuilder(
          future: fetchUsers(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  PaginatedDataTable(
                    source: dataSource(snapshot.data),
                    header: Text(
                      'Display Table',
                    ),
                    rowsPerPage: 10,
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('First Name')),
                      DataColumn(label: Text('Middle Name')),
                      DataColumn(label: Text('Last Name')),
                      DataColumn(label: Text('Contact Number')),
                      DataColumn(label: Text('Username')),
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
        drawer: Drawer(
          //====Navigation Bar====
          child: List_view(),
        ),
        floatingActionButton: Speed_Dial(),
      ),
    );
  }

  DataTableSource dataSource(List<Users> usersList) =>
      MyData(dataList: usersList);
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
        // DataCell(
        //   Text(dataList[index].roles.toString()),
        // ),
      ],
    );
  }

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: _shrineColorScheme,
      // accentColor: shrineBrown900,
      primaryColor: shrinePink100,
      // buttonColor: shrinePink100,
      scaffoldBackgroundColor: shrineBackgroundWhite,
      cardColor: shrineBackgroundWhite,
      // textSelectionColor: shrinePink100,
      errorColor: shrineErrorRed,
      buttonTheme: const ButtonThemeData(
        colorScheme: _shrineColorScheme,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: _customIconTheme(base.iconTheme),
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      // accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      iconTheme: _customIconTheme(base.iconTheme),
    );
  }

  IconThemeData _customIconTheme(IconThemeData original) {
    return original.copyWith(color: shrineBrown900);
  }

  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          caption: base.caption?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: defaultLetterSpacing,
          ),
          button: base.button?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: defaultLetterSpacing,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: shrineBrown900,
          bodyColor: shrineBrown900,
        );
  }
}
//============COLOR SCHEMA=============
const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  // primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  // secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
