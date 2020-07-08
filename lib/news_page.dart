import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'http_util.dart';
import 'model/api.dart';
import 'model/entity/news_list_entity.dart';
import 'model/entity/news_type_entity.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends State with AutomaticKeepAliveClientMixin {
  PageController _pageController;
  List<NewsTypeEntity> _types = List<NewsTypeEntity>();
  Map<int, List<NewsListEntity>> _typeNews = Map();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    HttpUtil.getInstance().doGet<List<NewsTypeEntity>>(Api.newsTypes,
        data: (types) {
      setState(() {
        _types = types;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    List tabs = new List<Tab>();
    List newsLists = new List<Widget>();

    _types.forEach((element) {
      tabs.add(Tab(text: element.typeName));
    });

    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: TabBar(
                tabs: tabs,
                onTap: onTap,
                isScrollable: true,
              ),
            ),
            body: PageView.builder(
                itemBuilder: (context, index) {
                  final typeId = _types[index].typeId;
                  final news = _typeNews[typeId];

                  return ListView.builder(
                    itemBuilder: (context, index) {
                      var newsItem = news != null && index < news.length
                          ? news[index]
                          : null;
                      return newsItem == null
                          ? null
                          : Row(
                              children: <Widget>[
                                Expanded(
                                    child: 
                                    newsItem.imgList.length != 0
                                        ? Image.network(newsItem.imgList[0])
                                        :Center()
                                ),
                                Expanded(child: Text(newsItem.title))
                              ],
                            );
                    },
                    itemCount: news != null ? news.length : 0,
                  );
                },
                onPageChanged: onPageChanged,
                controller: _pageController,
                itemCount: _types.length,
                physics: NeverScrollableScrollPhysics())));
  }

  onPageChanged(value) {
    final typeId = _types[value].typeId;
    HttpUtil.getInstance().doGet<List<NewsListEntity>>(Api.newsList,
        params: {"typeId": typeId, "page": 1},
        data: (List<NewsListEntity> data) {
      log(data.toString());

      setState(() {
        _typeNews[typeId] = data;
      });
    });
  }

  onTap(value) {
    _pageController.jumpToPage(value);
  }
}
