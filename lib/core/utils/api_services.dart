import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<Response> post(
      {required body,
      required String url,
      required String token,
        Map<String,dynamic>?headers,
      String? contentType}) async {
    final response = await dio.post(url,
        data: body,
        options: Options(
            validateStatus: (_) => true,
            contentType: Headers.formUrlEncodedContentType,
            headers:headers?? {'Authorization': 'Bearer $token'}));
    return response;
  }
}
