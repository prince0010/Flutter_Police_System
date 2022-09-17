import 'package:http/http.dart' as http;
import 'package:policesystem/model/user_model.dart';



Future<List> fetchPagedUsers(currentPage) async {
  Uri url = Uri.parse(
      "http://127.0.0.1:8000/api/paged-users?page=" + currentPage.toString());
  final response = await http.get(url);
  return usersFromPagedJson(response.body);
}
