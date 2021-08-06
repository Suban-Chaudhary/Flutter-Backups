class WeatherInfo {
  List<Weather>? weather;
  Coord? coord;
  Sys? sys;
  Main? main;
  String? base;
  int? visibility;
  int? timezone;
  int? name;

  WeatherInfo({
    this.weather,
    this.coord,
    this.sys,
    this.main,
    this.base,
    this.visibility,
    this.timezone,
    this.name,
  });

  WeatherInfo.fromJson(Map<dynamic, dynamic> json) {
    if (json["weather"] != null) {
      json["weather"].forEach((val) {
        this.weather!.add(Weather.fromJson(val));
      });
    }

    this.coord = json["coord"] != null ? Coord.fromJson(json["coord"]) : null;
    this.main = json["main"] != null ? Main.fromJson(json["main"]) : null;
    this.sys = json["sys"] != null ? Sys.fromJson(json["sys"]) : null;

    this.base = json["base"];
    this.visibility = json["visibility"];
    this.timezone = json["timezone"];
    this.name = json["name"];
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.main = json["main"];
    this.description = json["description"];
    this.icon = json["icon"];
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main.fromJson(Map<String, dynamic> json) {
    this.temp = json["temp"];
    this.feelsLike = json["feelsLike"];
    this.tempMin = json["tempMin"];
    this.tempMax = json["tempMax"];
    this.pressure = json["pressure"];
    this.humidity = json["humidity"];
  }
}

class Wind {
  double? speed;
  double? deg;

  Wind.fromJson(Map<String, dynamic> json) {
    this.speed = json["lon"];
    this.deg = json["lat"];
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord.fromJson(Map<String, dynamic> json) {
    this.lon = json["lon"];
    this.lat = json["lat"];
  }
}

class Sys {
  String? country;
  int? type;
  int? id;
  int? sunrise;
  int? sunset;

  Sys.fromJson(Map<String, dynamic> json) {
    this.type = json["type"];
    this.id = json["id"];
    this.country = json["country"];
    this.sunrise = json["sunrise"];
    this.sunset = json["sunset"];
  }
}
