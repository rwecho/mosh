import 'dart:io';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:mosh/v2ex_core/models/my_node.dart';
import 'package:mosh/v2ex_core/models/node_link.dart';

import 'service_base.dart';

class NodeService extends ServiceBase {
  Future<List<NodeLink>> getAllNodeLinks() async {
    var uri = Uri.parse('$baseUrl/planes');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }

    var document = parse(response.body);
    var links = document.querySelectorAll("#Main .inner a");
    return links
        .map((o) => [o.attributes["href"], o.text])
        .where(
            (o) => (o[0]?.isNotEmpty ?? false) && (o[1]?.isNotEmpty ?? false))
        .map((o) => NodeLink(o[0]!, o[1]!))
        .toList();
  }

  Future<Iterable<MyNode>> getMyNodes() async {
    var uri = Uri.parse('$baseUrl/my/nodes');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }
    var document = parse(response.body);

    var links = document.querySelectorAll("div#my-nodes>a");
    MyNode parseMyNode(Element element) {
      var name = element.attributes["href"]?.split("/").last;
      var avatar = element.querySelector("img")?.attributes["src"];

      var topicTotalCount =
          int.parse(element.querySelectorAll("span")[1].text.trim());

      return MyNode(name!, avatar!, topicTotalCount);
    }

    return links.map((o) => parseMyNode(o));
  }
}
