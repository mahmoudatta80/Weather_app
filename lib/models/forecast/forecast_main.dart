class Main {
  late final dynamic temp;
  late final dynamic feels_like;
  late final dynamic temp_min;
  late final dynamic temp_max;
  late final dynamic pressure;
  late final dynamic sea_level;
  late final dynamic grnd_level;
  late final dynamic humidity;
  late final dynamic temp_kf;

  Main.fromJson(Map<String , dynamic> json) {
    temp = json['temp'];
    feels_like = json['feels_like'];
    temp_min = json['temp_min'];
    temp_max = json['temp_max'];
    pressure = json['pressure'];
    sea_level = json['sea_level'];
    grnd_level = json['grnd_level'];
    humidity = json['humidity'];
    temp_kf = json['temp_kf'];
  }
}