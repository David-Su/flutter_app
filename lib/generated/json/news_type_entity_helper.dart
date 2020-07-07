import 'package:flutter_app/model/entity/news_type_entity.dart';

newsTypeEntityFromJson(NewsTypeEntity data, Map<String, dynamic> json) {
	if (json['typeId'] != null) {
		data.typeId = json['typeId']?.toInt();
	}
	if (json['typeName'] != null) {
		data.typeName = json['typeName']?.toString();
	}
	return data;
}

Map<String, dynamic> newsTypeEntityToJson(NewsTypeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['typeId'] = entity.typeId;
	data['typeName'] = entity.typeName;
	return data;
}