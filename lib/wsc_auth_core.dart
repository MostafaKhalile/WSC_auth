part of 'wsc_auth.dart';

class WSCAuth {
  WSCAuth._();

  /// [initializeApp] is The entry point for accessing [WSCAuth] services like 'OAuth 2.0','Login','Signup', etc... .
  /// you should add your server baseURL to make sure all API Integrations works good.
  static initializeApp({required String baseURL}) async {
    assert(baseURL.isNotEmpty, 'The baseURL shouldn\'t be Empty');
    assert(baseURL.startsWith('https') || baseURL.startsWith('http'),
        'The url should start with http/https');
    ApiClient.initialize(baseUrl: baseURL);
    await boot();
  }
}
