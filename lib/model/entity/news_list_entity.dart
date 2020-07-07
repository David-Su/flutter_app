import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class NewsListEntity with JsonConvert<NewsListEntity> {
	String title;
	dynamic imgList;
	String source;
	String newsId;
	String digest;
	String postTime;
	dynamic videoList;
}
