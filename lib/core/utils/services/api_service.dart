import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required dynamic body,
    required String token,
    Map<String, String>? header,
    String? contentType,
  }) async {
    final mergedHeaders = {
      'Authorization': 'Bearer $token',
      ...?header,
    };

    return await dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType ?? Headers.formUrlEncodedContentType,
        headers: mergedHeaders,
      ),
    );
  }
}
