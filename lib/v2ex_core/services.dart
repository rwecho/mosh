import 'dart:io';

import 'package:mosh/v2ex_core/models.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

isSuccessHttpStatusCode(int statusCode) {
  return statusCode >= 200 && statusCode <= 299;
}

class ServiceBase {
  String baseUrl = "https://v2ex.com";
}

class LoginService extends ServiceBase {
  Future<SignIn> createSignIn() async {
    var requestUri = Uri.parse('$baseUrl/signin');
    var response = await http.get(requestUri);

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
        trElements[1].getElementsByClassName('input')[0].attributes['name']!;
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

  getCaptcha(SignIn signIn) async {
    var requestUri = Uri.parse('$baseUrl${signIn.captcha}');
    var response = await http.get(requestUri);
    if (response.statusCode != 200) {
      throw HttpException(response.reasonPhrase ?? "", uri: requestUri);
    }

    // todo, convert content to image.
    return response.body;
  }

  login(String userName, String password, String captcha, SignIn signIn) async {
    var requestUri = Uri.parse('$baseUrl/signin');
    var response = await http.post(requestUri);

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

class NodeService extends ServiceBase {
  getAllNodeLinks() async {
    var uri = Uri.parse('$baseUrl/planes');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }

    var document = parse(response.body);
    var links = document.querySelectorAll("");
    return links;
  }

  getMyNodes() async {
    var uri = Uri.parse('$baseUrl/my/nodes');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }
    var document = parse(response.body);
    return document;
  }
}

class SettingService extends ServiceBase {
  getMyProfile() async {
    var uri = Uri.parse('$baseUrl/settings/profile');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }

    var document = parse(response.body);

    return document;
  }
}

class TopicService extends ServiceBase {
  getMyTopics({int currentPage = 0}) async {
    var uri = currentPage == 0
        ? Uri.parse('$baseUrl/my/topics')
        : Uri.parse('$baseUrl/my/topics?p=$currentPage');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }

    var document = parse(response.body);

    return document;
  }

  getTopics(String node, {int currentPage = 0}) async {
    var uri = currentPage == 0
        ? Uri.parse('$baseUrl/go/$node')
        : Uri.parse('$baseUrl/go/$node?p=$currentPage');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }
    var document = parse(response.body);
    return document;
  }

  getTabTopics(String tab) async {
    var uri = Uri.parse('$baseUrl/?tab=$tab');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }
    var document = parse(response.body);
    return document;
  }

  getRecentTopics({int currentPage = 0}) async {
    var uri = currentPage == 0
        ? Uri.parse('$baseUrl/recent')
        : Uri.parse('$baseUrl/recent?p=$currentPage');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }
    var document = parse(response.body);
    return document;
  }

  getTopic(int topicId, {int currentPage = 0}) async {
    var uri = currentPage == 0
        ? Uri.parse('$baseUrl/t/$topicId')
        : Uri.parse('$baseUrl/t/$topicId?p=$currentPage');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }
    var document = parse(response.body);
    return document;
  }
}

class TopicTabService {
  Iterable<TopicTab> getTopicTabs() sync* {
    yield const TopicTab("tech", "技术");
    yield const TopicTab("creation", "创意");
    yield const TopicTab("play", "好玩");
    yield const TopicTab("apple", "Apple");
    yield const TopicTab("jobs", "酷工作");
    yield const TopicTab("deals", "交易");
    yield const TopicTab("city", "城市");
    yield const TopicTab("qna", "问与答");
    yield const TopicTab("hot", "最热");
    yield const TopicTab("all", "全部");
    yield const TopicTab("r2", "R2");
    yield const TopicTab("nodes", "节点");
    yield const TopicTab("members", "关注");
  }
}
