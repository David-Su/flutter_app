import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/news_detail_page.dart';

import 'http_util.dart';
import 'model/api.dart';
import 'model/entity/news_list_entity.dart';

class NewsListPage extends StatefulWidget {
  NewsListPage(this._typeId);

  int _typeId;

  @override
  State<StatefulWidget> createState() => _NewsListPage();
}

class _NewsListPage extends State<NewsListPage> {
  List<NewsListEntity> newsList = List();
  ScrollController _scrollController = ScrollController();
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) loadList();
    });
    loadList();
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemBuilder: (context, index) {
          var newsItem = index < newsList.length ? newsList[index] : null;
          return newsItem == null
              ? null
              : GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: newsItem.imgList.length != 0
                              ? Image.network(newsItem.imgList[0])
                              : Placeholder()),
                      Expanded(child: Text(newsItem.title))
                    ],
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => NewsDetailPage(newsItem.newsId),
                      )),
                );
        },
        itemCount: newsList != null ? newsList.length : 0,
        controller: _scrollController,
      );

  loadList() {
    HttpUtil.getInstance().doGet<List<NewsListEntity>>(Api.newsList,
        params: {"typeId": widget._typeId, "page": _page++},
        data: (List<NewsListEntity> data) {
      log(data.toString());
      setState(() {
        newsList.addAll(data);
      });
    });
  }
}
