import 'package:flutter_test/flutter_test.dart';
import 'package:mosh/v2ex_core/services/node_service.dart';

void main() async {
  var nodeService = NodeService();
  test("test node service", () async {
    var nodeLinks = await nodeService.getAllNodeLinks();
    expect(nodeLinks.isNotEmpty, true);
  });
}
