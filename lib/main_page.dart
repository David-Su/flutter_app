import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/http_util.dart';
import 'package:flutter_app/model/api.dart';
import 'package:flutter_app/model/entity/news_list_entity.dart';
import 'package:flutter_app/news_page.dart';
import 'package:intl/intl.dart';

import 'model/entity/news_type_entity.dart'; // 需要在 pubspec.yaml 增加该模块

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageWidget();
}

class _MainPageWidget extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  static String text = "demo";
  List<Widget> pages = [NewsPage(), Text(text), Text(text), Text(text)];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("当前时间"),
      ),
      bottomNavigationBar: Material(
        child: TabBar(
            controller: _tabController,
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.black54,
            onTap: (value) => _pageController.jumpToPage(value),
            tabs: <Tab>[
              Tab(text: "新闻", icon: Icon(Icons.home)),
              Tab(text: "新闻", icon: Icon(Icons.home)),
              Tab(text: "新闻", icon: Icon(Icons.home)),
              Tab(text: "新闻", icon: Icon(Icons.home))
            ]),
      ),
      body: PageView.builder(
        itemBuilder: (context, index) => pages[index],
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
      ));
}
