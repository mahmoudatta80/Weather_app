class Main {
  late final dynamic temp;
  late final dynamic feels_like;
  late final dynamic temp_min;
  late final dynamic temp_max;
  late final dynamic pressure;
  late final dynamic humidity;

  Main.fromJson(Map<String , dynamic> json) {
    temp = json['temp'];
    feels_like = json['feels_like'];
    temp_min = json['temp_min'];
    temp_max = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}
