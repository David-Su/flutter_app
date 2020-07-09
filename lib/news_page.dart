import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/news_list_page.dart';
import 'http_util.dart';
import 'model/api.dart';
import 'model/entity/news_list_entity.dart';
import 'model/entity/news_type_entity.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends State with AutomaticKeepAliveClientMixin {
  PageController _pageController = PageController();
  List<NewsTypeEntity> _types = List<NewsTypeEntity>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
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
                  return NewsListPage(_types[index].typeId);
                },
                controller: _pageController,
                itemCount: _types.length,
                physics: NeverScrollableScrollPhysics())));
  }

  onTap(value) {
    _pageController.jumpToPage(value);
  }
}
