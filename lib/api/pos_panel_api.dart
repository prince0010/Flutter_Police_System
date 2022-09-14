import 'package:http/http.dart' as http;
import 'package:policesystem/model/pos_model.dart';

Future<List<Positions>> fetchPositions() async {
  Uri url = Uri.parse("http://127.0.0.1:8000/api/positions");
  final response = await http.get(url);
  return positionsFromJson(response.body);
}
