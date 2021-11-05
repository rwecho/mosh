import 'dart:io';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:mosh/core/models/my_node.dart';
import 'package:mosh/core/models/reply.dart';
import 'package:mosh/core/models/topic.dart';
import 'package:mosh/core/models/topic_info.dart';

import 'service_base.dart';

class TopicService extends ServiceBase {
  Future<PagedResult<TopicInfo>> getMyTopics({int currentPage = 0}) async {
    var uri = currentPage == 0
        ? Uri.parse('$baseUrl/my/topics')
        : Uri.parse('$baseUrl/my/topics?p=$currentPage');
    var response = await http.get(uri, headers: headers);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }

    var document = parse(response.body);

    var parsedCurrentPage = 1;
    var currentPageNode = document.querySelector("a.page_current");
    if (currentPageNode != null) {
      parsedCurrentPage = int.parse(currentPageNode.text);
    }

    var parsedTotalPage = parsedCurrentPage;
    var normalPages = document.querySelectorAll("a.page_normal");
    if (normalPages.isNotEmpty) {
      parsedTotalPage = int.parse(normalPages.last.text);
    }
    var items = _extractTopicInfos(document).toList();
    return PagedResult(parsedCurrentPage, parsedTotalPage, items);
  }

  Iterable<TopicInfo> _extractTopicInfos(Document document) {
    var cellItems = document.querySelectorAll("div>.cell.item");
    TopicInfo _parseTopic(Element element) {
      var titleNode = element.querySelector("a.topic-link");
      var title = titleNode!.text;
      var id =
          int.parse(titleNode.attributes["href"]!.split("/")[2].split("#")[0]);

      var avatar = element.querySelector("img.avatar")!.attributes["src"]!;

      var topicInfoElement = element.querySelector("span.topic_info")!;
      var nodeTitleElement = topicInfoElement.querySelector("a.node")!;
      var nodeTitle = nodeTitleElement.text;
      var nodeName = nodeTitleElement.attributes["href"]!.split("/")[2];

      var userName = topicInfoElement.querySelector("strong>a")!.text;
      var votes = topicInfoElement.querySelector("div.votes")!.text;
      var latestReplyTime =
          topicInfoElement.querySelector("span[title]")!.attributes["title"]!;
      var replies =
          int.parse(element.querySelector("a.count_livid")?.text ?? "0");

      String latestReplyUserName = "";
      var replyElements = topicInfoElement.querySelectorAll("strong>a");
      if (replyElements.length > 1) {
        latestReplyUserName = replyElements[1].text;
      }
      return TopicInfo(id, title, avatar, userName, nodeTitle, nodeName, votes,
          replies, latestReplyUserName, DateTime.parse(latestReplyTime));
    }

    return cellItems.map((o) => _parseTopic(o));
  }

  Future<PagedResult<TopicInfo>> getTopics(String node,
      {int currentPage = 0}) async {
    var uri = currentPage == 0
        ? Uri.parse('$baseUrl/go/$node')
        : Uri.parse('$baseUrl/go/$node?p=$currentPage');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }
    var document = parse(response.body);
    var parsedCurrentPage = 1;
    var currentPageNode = document.querySelector("a.page_current");
    if (currentPageNode != null) {
      parsedCurrentPage = int.parse(currentPageNode.text);
    }

    var parsedTotalPage = parsedCurrentPage;
    var normalPages = document.querySelectorAll("a.page_normal");
    if (normalPages.isNotEmpty) {
      parsedTotalPage = int.parse(normalPages.last.text);
    }
    var items = _extractTopicInfos(document).toList();
    return PagedResult(parsedCurrentPage, parsedTotalPage, items);
  }

  Future<List<TopicInfo>> getTabTopics(String tab) async {
    var uri = Uri.parse('$baseUrl/?tab=$tab');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }
    var document = parse(response.body);
    return _extractTopicInfos(document).toList();
  }

  Future<PagedResult<TopicInfo>> getRecentTopics({int currentPage = 0}) async {
    var uri = currentPage == 0
        ? Uri.parse('$baseUrl/recent')
        : Uri.parse('$baseUrl/recent?p=$currentPage');
    var response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(response.reasonPhrase ?? '', uri: uri);
    }
    var document = parse(response.body);
    var parsedCurrentPage = 1;
    var currentPageNode = document.querySelector("a.page_current");
    if (currentPageNode != null) {
      parsedCurrentPage = int.parse(currentPageNode.text);
    }

    var parsedTotalPage = parsedCurrentPage;
    var normalPages = document.querySelectorAll("a.page_normal");
    if (normalPages.isNotEmpty) {
      parsedTotalPage = int.parse(normalPages.last.text);
    }
    var items = _extractTopicInfos(document).toList();
    return PagedResult(parsedCurrentPage, parsedTotalPage, items);
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
    var parsedCurrentPage = 1;
    var currentPageNode = document.querySelector("a.page_current");
    if (currentPageNode != null) {
      parsedCurrentPage = int.parse(currentPageNode.text);
    }

    var parsedTotalPage = parsedCurrentPage;
    var normalPages = document.querySelectorAll("a.page_normal");
    if (normalPages.isNotEmpty) {
      parsedTotalPage = int.parse(normalPages.last.text);
    }

    var mainElement = document.querySelector("div#Main")!;
    var id = int.parse(mainElement
        .querySelector("div.votes")!
        .attributes["id"]!
        .split("_")[1]);
    var headerElement = mainElement.querySelector("div.header")!;
    var nodeAnchorElement = headerElement.querySelectorAll("a")[2];

    var nodeName = nodeAnchorElement.attributes["href"]!;
    var nodeTitle = nodeAnchorElement.text;

    var title = headerElement.querySelector("h1")!.text;
    var userName = headerElement.querySelector("small>a")!.text;
    var avatar = headerElement.querySelector("img.avatar")!.attributes["src"]!;
    var latestCreationTime =
        headerElement.querySelector("small>span")!.attributes["title"]!;
    // var clicks = headerElement.querySelector("small")?.text;

    var topicContent = mainElement
        .querySelector("div.cell>div.topic_content>div.markdown_body")!
        .innerHtml;
    var topicSubtles = mainElement
        .querySelectorAll("div.subtle>div.topic_content>markdown_body")
        .map((o) => o.innerHtml)
        .toList();

    var topicReplyElements = mainElement.querySelectorAll("div.box>tr");

    Reply parseReply(Element element) {
      var avatar = element.querySelector("img.avatar")!.attributes["src"]!;
      var no = int.parse(element.querySelector("span.no")!.text);
      var userName = element.querySelector("strong>a")!.text;
      var replyTime = element.querySelector("span.age")!.attributes["title"]!;
      var replyContent = element.querySelector("div.reply_content")!.innerHtml;

      var thanks = 0;
      var imageNodes = element.querySelectorAll("img");

      if (imageNodes.length > 1) {
        var thanksText = imageNodes[1].parentNode!.text!.trim();
        if (thanksText.isNotEmpty) {
          thanks = int.parse(thanksText);
        }
      }

      return Reply(thanks, avatar, replyContent, userName, replyTime, no);
    }

    var replies = topicReplyElements.map((o) => parseReply(o)).toList();

    return Topic(
        id,
        nodeName,
        nodeTitle,
        topicContent,
        topicSubtles,
        title,
        userName,
        avatar,
        latestCreationTime,
        0,
        PagedResult(parsedCurrentPage, parsedTotalPage, replies));
  }
}
