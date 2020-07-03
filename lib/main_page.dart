import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/HttpUtil.dart';
import 'package:intl/intl.dart'; // 需要在 pubspec.yaml 增加该模块

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageWidget();
}

class _MainPageWidget extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    HttpUtil.getInstance().doGet("/news/types", data: (data) {
      log(data.toString());
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("当前时间"),
        ),
        body: TabBarView(controller: tabController, children: <Widget>[
          Text("demo"),
          Text("demo"),
          Text("demo"),
          Text("demo")
        ]),
        bottomNavigationBar: Material(
          child: TabBar(
              controller: tabController,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.black54,
              tabs: <Tab>[
                Tab(text: "新闻", icon: Icon(Icons.home)),
                Tab(text: "新闻", icon: Icon(Icons.home)),
                Tab(text: "新闻", icon: Icon(Icons.home)),
                Tab(text: "新闻", icon: Icon(Icons.home))
              ]),
        ),
      );

  String getCurrTime() =>
      DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
}
