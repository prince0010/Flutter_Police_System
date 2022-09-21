import 'package:http/http.dart' as http;
import 'package:policesystem/model/user_model.dart';

Future<List> fetchPagedUsers() async {
  // Uri url = Uri.parse(
  // "http://127.0.0.1:8000/api/paged-users?page=" + currentPage.toString());
  Uri url = Uri.parse("http://127.0.0.1:8000/api/paged-users");
  final response = await http.get(url);
  print(response.body);
  return usersFromPagedJson(response.body);
}
