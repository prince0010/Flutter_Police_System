import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Response> login(String username, String password) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:8000/api/auth/login',
        data: {'username': username, 'password': password},
        queryParameters: {'apiKey': 'YOUR_API_KEY'},
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<Response> getUserProfileData(String accesstoken) async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:8000/api/auth/login',
        queryParameters: {'apikey': 'YOUR_API_KEY'},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${accesstoken}',
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
//   Future<Response> logout(String accessToken) async {
//         try {
//           Response response = await _dio.get(
//             'http://127.0.0.1:8000/api/auth/login',
//             queryParameters: {'apikey': ApiSecret.apiKey},
//             options: Options(
//               headers: {'Authorization': 'Bearer $accessToken'},
//             ),
//           );
//           return response.data;
//         } on DioError catch (e) {
//           return e.response!.data;
//         }
//       }
// }
}
