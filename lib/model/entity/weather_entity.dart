import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class WeatherEntity with JsonConvert<WeatherEntity> {
	String address;
	String cityCode;
	String reportTime;
	List<WeatherForecast> forecasts;
}

class WeatherForecast with JsonConvert<WeatherForecast> {
	String date;
	String dayOfWeek;
	String dayWeather;
	String nightWeather;
	String dayTemp;
	String nightTemp;
	String dayWindDirection;
	String nightWindDirection;
	String dayWindPower;
	String nightWindPower;
}
