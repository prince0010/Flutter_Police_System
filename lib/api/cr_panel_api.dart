import 'package:http/http.dart' as http;
import 'package:policesystem/model/cr_model.dart';

Future<List<Cr>> fetchCr() async {
  Uri url = Uri.parse("http://127.0.0.1:8000/api/cr");
  final response = await http.get(url);
  return CrFromJson(response.body);
}
