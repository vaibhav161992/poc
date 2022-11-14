import 'dart:convert';

List<ForecastData> forecastDataFromJson(String str) => List<ForecastData>.from(json.decode(str).map((x) => ForecastData.fromJson(x)));

String forecastDataToJson(List<ForecastData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForecastData {
  ForecastData({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.sys,
    required this.dtTxt,
  });

  final int dt;
  final Main? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final Sys? sys;
  final DateTime? dtTxt;

  factory ForecastData.fromJson(Map<String, dynamic> json) => ForecastData(
    dt: json["dt"] == null ? null : json["dt"],
    main: json["main"] == null ? null : Main.fromJson(json["main"]),
    weather: json["weather"] == null ? null : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
    wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
    visibility: json["visibility"] == null ? null : json["visibility"],
    sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
    dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt == null ? null : dt,
    "main": main == null ? null : main!.toJson(),
    "weather": weather == null ? null : List<dynamic>.from(weather!.map((x) => x.toJson())),
    "clouds": clouds == null ? null : clouds!.toJson(),
    "wind": wind == null ? null : wind!.toJson(),
    "visibility": visibility == null ? null : visibility,
    "sys": sys == null ? null : sys!.toJson(),
    "dt_txt": dtTxt == null ? null : dtTxt!.toIso8601String(),
  };
}

class Clouds {
  Clouds({
    required this.all,
  });

  final int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"] == null ? null : json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all == null ? null : all,
  };
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"] == null ? null : json["temp"].toDouble(),
    feelsLike: json["feels_like"] == null ? null : json["feels_like"].toDouble(),
    tempMin: json["temp_min"] == null ? null : json["temp_min"].toDouble(),
    tempMax: json["temp_max"] == null ? null : json["temp_max"].toDouble(),
    pressure: json["pressure"] == null ? null : json["pressure"],
    seaLevel: json["sea_level"] == null ? null : json["sea_level"],
    grndLevel: json["grnd_level"] == null ? null : json["grnd_level"],
    humidity: json["humidity"] == null ? null : json["humidity"],
    tempKf: json["temp_kf"] == null ? null : json["temp_kf"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp == null ? null : temp,
    "feels_like": feelsLike == null ? null : feelsLike,
    "temp_min": tempMin == null ? null : tempMin,
    "temp_max": tempMax == null ? null : tempMax,
    "pressure": pressure == null ? null : pressure,
    "sea_level": seaLevel == null ? null : seaLevel,
    "grnd_level": grndLevel == null ? null : grndLevel,
    "humidity": humidity == null ? null : humidity,
    "temp_kf": tempKf == null ? null : tempKf,
  };
}

class Sys {
  Sys({
    required this.pod,
  });

  final String pod;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    pod: json["pod"] == null ? null : json["pod"],
  );

  Map<String, dynamic> toJson() => {
    "pod": pod == null ? null : pod,
  };
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"] == null ? null : json["id"],
    main: json["main"] == null ? null : json["main"],
    description: json["description"] == null ? null : json["description"],
    icon: json["icon"] == null ? null : json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "main": main == null ? null : main,
    "description": description == null ? null : description,
    "icon": icon == null ? null : icon,
  };
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  final double speed;
  final int deg;
  final double gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"] == null ? null : json["speed"].toDouble(),
    deg: json["deg"] == null ? null : json["deg"],
    gust: json["gust"] == null ? null : json["gust"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "speed": speed == null ? null : speed,
    "deg": deg == null ? null : deg,
    "gust": gust == null ? null : gust,
  };
}
