import 'package:http/http.dart' as http;
import 'package:policesystem/model/user_model.dart';

Future<List> fetchUsers() async {
  Uri url = Uri.parse("http://127.0.0.1:8000/api/users");
  final response = await http.get(url);
  return usersFromJson(response.body);
}
