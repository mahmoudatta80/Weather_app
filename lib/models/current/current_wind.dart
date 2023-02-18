class Wind {
  late final dynamic speed;
  late final dynamic deg;

  Wind.fromJson(Map<String , dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }
}