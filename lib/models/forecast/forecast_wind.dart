class Wind {
  late final dynamic speed;
  late final dynamic deg;
  late final dynamic gust;

  Wind.fromJson(Map<String , dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }
}