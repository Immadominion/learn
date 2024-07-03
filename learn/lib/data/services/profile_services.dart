import 'package:dio/dio.dart' show Response;

import 'dio_mixin.dart';

class GetProjects with DioMixin {
  Future<Response<dynamic>> getQuizByQuery(String query) async {
    final customHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
    };
    final response = await connect(customHeaders: customHeaders).get(
      '/quiz?s=$query',
    );
    return response;
  }
}
