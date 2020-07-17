import 'package:flutter_app/model/entity/weather_entity.dart';

weatherEntityFromJson(WeatherEntity data, Map<String, dynamic> json) {
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['cityCode'] != null) {
		data.cityCode = json['cityCode']?.toString();
	}
	if (json['reportTime'] != null) {
		data.reportTime = json['reportTime']?.toString();
	}
	if (json['forecasts'] != null) {
		data.forecasts = new List<WeatherForecast>();
		(json['forecasts'] as List).forEach((v) {
			data.forecasts.add(new WeatherForecast().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> weatherEntityToJson(WeatherEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['address'] = entity.address;
	data['cityCode'] = entity.cityCode;
	data['reportTime'] = entity.reportTime;
	if (entity.forecasts != null) {
		data['forecasts'] =  entity.forecasts.map((v) => v.toJson()).toList();
	}
	return data;
}

weatherForecastFromJson(WeatherForecast data, Map<String, dynamic> json) {
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['dayOfWeek'] != null) {
		data.dayOfWeek = json['dayOfWeek']?.toString();
	}
	if (json['dayWeather'] != null) {
		data.dayWeather = json['dayWeather']?.toString();
	}
	if (json['nightWeather'] != null) {
		data.nightWeather = json['nightWeather']?.toString();
	}
	if (json['dayTemp'] != null) {
		data.dayTemp = json['dayTemp']?.toString();
	}
	if (json['nightTemp'] != null) {
		data.nightTemp = json['nightTemp']?.toString();
	}
	if (json['dayWindDirection'] != null) {
		data.dayWindDirection = json['dayWindDirection']?.toString();
	}
	if (json['nightWindDirection'] != null) {
		data.nightWindDirection = json['nightWindDirection']?.toString();
	}
	if (json['dayWindPower'] != null) {
		data.dayWindPower = json['dayWindPower']?.toString();
	}
	if (json['nightWindPower'] != null) {
		data.nightWindPower = json['nightWindPower']?.toString();
	}
	return data;
}

Map<String, dynamic> weatherForecastToJson(WeatherForecast entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['date'] = entity.date;
	data['dayOfWeek'] = entity.dayOfWeek;
	data['dayWeather'] = entity.dayWeather;
	data['nightWeather'] = entity.nightWeather;
	data['dayTemp'] = entity.dayTemp;
	data['nightTemp'] = entity.nightTemp;
	data['dayWindDirection'] = entity.dayWindDirection;
	data['nightWindDirection'] = entity.nightWindDirection;
	data['dayWindPower'] = entity.dayWindPower;
	data['nightWindPower'] = entity.nightWindPower;
	return data;
}