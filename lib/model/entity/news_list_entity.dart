import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class NewsListEntity with JsonConvert<NewsListEntity> {
	String title;
	List<String> imgList = List();
	String source;
	String newsId;
	dynamic digest;
	String postTime;
	dynamic videoList;
}
