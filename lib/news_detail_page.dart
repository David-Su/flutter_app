import 'package:flutter/material.dart';
import 'package:flutter_app/http_util.dart';
import 'package:flutter_app/model/api.dart';
import 'package:flutter_app/model/entity/news_detail_entity.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class NewsDetailPage extends StatefulWidget {
  NewsDetailPage(this.newsId);

  final String newsId;

  @override
  State<StatefulWidget> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  String content = "";

  String title = "";

  @override
  void initState() {
    super.initState();
    HttpUtil.getInstance().doGet<NewsDetailEntity>(
      Api.newsDetail,
      params: {"newsId": widget.newsId},
      data: (NewsDetailEntity data) {
        title = data.title;
        content = data.content;
        setState(() {
          data.images.forEach((element) {
            String width = element.size.substring(0, element.size.indexOf("*"));
            String height = element.size
                .substring(element.size.indexOf("*") + 1, element.size.length);
            content = content.replaceAll(
                element.position, "<img src=\"${element.imgSrc}\" width=\"$width\" height=\"$height\"/>");
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Html(
            data: content,
          ),
        ),
      );
}
