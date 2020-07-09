import 'package:flutter_app/model/entity/news_detail_entity.dart';

newsDetailEntityFromJson(NewsDetailEntity data, Map<String, dynamic> json) {
	if (json['images'] != null) {
		data.images = new List<NewsDetailImage>();
		(json['images'] as List).forEach((v) {
			data.images.add(new NewsDetailImage().fromJson(v));
		});
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['source'] != null) {
		data.source = json['source']?.toString();
	}
	if (json['ptime'] != null) {
		data.ptime = json['ptime']?.toString();
	}
	if (json['docid'] != null) {
		data.docid = json['docid']?.toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover']?.toString();
	}
	return data;
}

Map<String, dynamic> newsDetailEntityToJson(NewsDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.images != null) {
		data['images'] =  entity.images.map((v) => v.toJson()).toList();
	}
	data['title'] = entity.title;
	data['content'] = entity.content;
	data['source'] = entity.source;
	data['ptime'] = entity.ptime;
	data['docid'] = entity.docid;
	data['cover'] = entity.cover;
	return data;
}

newsDetailImageFromJson(NewsDetailImage data, Map<String, dynamic> json) {
	if (json['position'] != null) {
		data.position = json['position']?.toString();
	}
	if (json['imgSrc'] != null) {
		data.imgSrc = json['imgSrc']?.toString();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toString();
	}
	return data;
}

Map<String, dynamic> newsDetailImageToJson(NewsDetailImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['position'] = entity.position;
	data['imgSrc'] = entity.imgSrc;
	data['size'] = entity.size;
	return data;
}