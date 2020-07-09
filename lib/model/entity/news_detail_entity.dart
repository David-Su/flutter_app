import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class NewsDetailEntity with JsonConvert<NewsDetailEntity> {
	List<NewsDetailImage> images;
	String title;
	String content;
	String source;
	String ptime;
	String docid;
	String cover;
}

class NewsDetailImage with JsonConvert<NewsDetailImage> {
	String position;
	String imgSrc;
	String size;
}
