import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

import 'service_base.dart';

class SettingService extends ServiceBase {
  getMyProfile() async {
    var uri = Uri.parse('$baseUrl/settings/profile');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }

    var document = parse(response.body);

    //todo parse document.
    return document;
  }
}
