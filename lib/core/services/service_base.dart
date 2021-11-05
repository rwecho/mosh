import 'package:http/http.dart' as http;

class ServiceBase {
  String baseUrl = "https://v2ex.com";

  Map<String, String> headers = {};

  void updateCookie(http.Response response) {
    var rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}

isSuccessHttpStatusCode(int statusCode) {
  return statusCode >= 200 && statusCode <= 299;
}
