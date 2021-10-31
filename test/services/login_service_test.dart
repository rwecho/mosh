import 'package:flutter_test/flutter_test.dart';
import 'package:mosh/v2ex_core/services/login_service.dart';

void main() async {
  var loginServie = LoginService();
  test("test login service", () async {
    var singIn = await loginServie.createSignIn();
    var captcha = await loginServie.getCaptcha(singIn);

    expect(captcha.isNotEmpty, true);
  });
}
