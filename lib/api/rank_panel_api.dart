import 'package:http/http.dart' as http;
import 'package:policesystem/model/ranks_model.dart';

Future<List<Ranks>> fetchRanks() async {
  Uri url = Uri.parse("http://127.0.0.1:8000/api/ranks");
  final response = await http.get(url);
  return ranksFromJson(response.body);
}
