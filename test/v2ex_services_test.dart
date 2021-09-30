import 'package:flutter_test/flutter_test.dart';
// import 'package:mosh/v2ex_core/services.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;

void main() async {
  // var loginService = LoginService();
  // var _ = await loginService.createSignIn();

  test("test create sign in", () async {
    var response = await http.get(Uri.parse('http://v2ex.com'));

    if (response.statusCode != 200) {
      return;
    }

    var document = html.parse(response.body);

    var divs = document.getElementsByTagName("div");
    var query = document.querySelector("div");

    var head = query!.querySelector("#head");

    expectAsync0(() => response.statusCode == 200);
  });
}
