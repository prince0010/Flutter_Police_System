// import 'package:flutter/material.dart';
// import 'package:policesystem/admin_model/police_data_model.dart';
// import 'package:policesystem/admin_utilities/constants.dart';
// import 'package:policesystem/admin_utilities/screen_size.dart';
// import 'package:policesystem/admin_utilities/textstyle_extensions.dart';

// class OtherDetails extends StatelessWidget {
//   const OtherDetails({required Key key, required this.data})
//       : assert(data != null),
//         super(key: key);

//   final DataPolice data;

//   Iterable<MapEntry<String, String>> get _fieldValues =>
//       _onGenerateFields(data).entries;

//   @override
//   Widget build(BuildContext context) {
//     //

//     final _width = ScreenQueries.instance.width(context);

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         CloseButton(),
//         for (final _fieldValue in _fieldValues) ...[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 SizedBox(
//                   width: _width * 0.1,
//                   child: Text(_fieldValue.key),
//                 ),
//                 SizedBox(
//                   width: _width * 0.1,
//                   child: Text(
//                     _fieldValue.value,
//                     style: const TextStyle().bold,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ],
//     );
//   }

//   Map<String, String> _onGenerateFields(DataPolice data) {
//     final _fieldValues = {
//       DataTableConstants.colID: data.id.toString(),
//       DataTableConstants.colfname: data.first_name,
//       DataTableConstants.colmname: data.middle_name,
//       DataTableConstants.collastname: data.last_name,
//       DataTableConstants.colcontactno: data.contact_no,
//     };

//     return _fieldValues;
//   }
// }
