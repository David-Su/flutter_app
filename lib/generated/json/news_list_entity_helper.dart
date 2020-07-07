import 'package:flutter_app/model/entity/news_list_entity.dart';

newsListEntityFromJson(NewsListEntity data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['imgList'] != null) {
		data.imgList = json['imgList'];
	}
	if (json['source'] != null) {
		data.source = json['source']?.toString();
	}
	if (json['newsId'] != null) {
		data.newsId = json['newsId']?.toString();
	}
	if (json['digest'] != null) {
		data.digest = json['digest']?.toString();
	}
	if (json['postTime'] != null) {
		data.postTime = json['postTime']?.toString();
	}
	if (json['videoList'] != null) {
		data.videoList = json['videoList'];
	}
	return data;
}

Map<String, dynamic> newsListEntityToJson(NewsListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['imgList'] = entity.imgList;
	data['source'] = entity.source;
	data['newsId'] = entity.newsId;
	data['digest'] = entity.digest;
	data['postTime'] = entity.postTime;
	data['videoList'] = entity.videoList;
	return data;
}