import 'package:dio/dio.dart';

class ApiClient {
  late String baseUrl;

  ApiClient({required baseUrl});

  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (_) => true,
        followRedirects: false,
        contentType: 'application/json',
        headers: {'accept': 'application/json'},
      ),
    );

    return dio;
  }

  Response _validate(Response res) {
    // if (res.statusCode == 500) {
    //   throw 'Server Error';
    // } else if (res.statusCode == 404) {
    //   throw 'Not Found';
    // } else if (res.statusCode == 422) {
    //   throw 'Validation Error';
    // } else if (res.data == null) {
    //   throw 'api returned null response';
    // }
    return res;
  }

  /// sends a [GET] request to the given [url]
  Future<Response> get(
    String url, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = false,
    bool wantBytes = false,
  }) async {
    final res = await dio.get(
      url,
      queryParameters: {...query},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          ...headers,
        },
        responseType: wantBytes ? ResponseType.bytes : null,
      ),
    );
    return _validate(res);
  }

  Future<Response> post(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
  }) async {
    final res = await dio.post(
      path,
      data: body,
      queryParameters: {...query},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          ...headers,
        },
        contentType: contentType,
      ),
    );
    return _validate(res);
  }

  Future<Response> put(
    String path, {
    dynamic body = const {},
    bool attachToken = true,
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
  }) async {
    final res = await dio.put(
      path,
      data: body,
      queryParameters: {...query},
      options: Options(
        headers: {
          ...headers,
        },
      ),
    );
    return _validate(res);
  }

  Future<Response> delete(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
  }) async {
    final res = await dio.delete(
      path,
      data: body,
      queryParameters: {...query},
      options: Options(
        headers: {
          ...headers,
        },
      ),
    );
    return _validate(res);
  }
}
