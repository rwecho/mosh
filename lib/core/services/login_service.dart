import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

import 'service_base.dart';
import '../models/signin.dart';

class LoginService extends ServiceBase {
  Future<SignIn> createSignIn() async {
    var requestUri = Uri.parse('$baseUrl/signin');
    var response = await http.get(requestUri, headers: headers);

    updateCookie(response);

    if (!isSuccessHttpStatusCode(response.statusCode)) {
      throw HttpException(response.reasonPhrase ?? "", uri: requestUri);
    }

    var document = parse(response.body);
    var element = document.getElementById('Main');

    if (element == null) {
      throw ArgumentError.notNull();
    }
    var trElements = element.getElementsByTagName('tr');
    var nameOfUserName =
        trElements[0].getElementsByTagName('input')[0].attributes['name']!;
    var nameOfPassword =
        trElements[1].getElementsByTagName('input')[0].attributes['name']!;
    var nameOfCaptcha =
        trElements[2].getElementsByTagName('input')[0].attributes['name']!;
    var once = trElements[2]
        .getElementsByTagName('div')[0]
        .attributes['style']!
        .split(';')[0]
        .split('=')[1]
        .split('\'')[0];
    return SignIn(nameOfUserName, nameOfPassword, nameOfCaptcha, once);
  }

  Future<String> getCaptcha(SignIn signIn) async {
    var requestUri = Uri.parse('$baseUrl${signIn.captcha}');
    var response = await http.get(requestUri, headers: headers);
    updateCookie(response);
    if (response.statusCode != 200) {
      throw HttpException(response.reasonPhrase ?? "", uri: requestUri);
    }

    var imageContent = response.bodyBytes;
    return base64.encode(imageContent);
  }

  login(String userName, String password, String captcha, SignIn signIn) async {
    var requestUri = Uri.parse('$baseUrl/signin');
    var response = await http.post(requestUri, headers: headers);

    if (response.statusCode != HttpStatus.temporaryRedirect) {
      throw HttpException(response.reasonPhrase ?? "", uri: requestUri);
    }

    if (!response.headers.containsKey('Set-Cookie')) {
      throw Exception("Can not receive set-cookie of logined user.");
    }
    var setCookies = response.headers['Set-Cookie']!;

    if (!setCookies.startsWith("A2=")) {
      throw Exception("V2ex login success cookies must start with A2=.");
    }
  }

  logout() {}
}
