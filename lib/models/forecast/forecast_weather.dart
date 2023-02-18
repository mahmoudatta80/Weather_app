class Weather {
  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String , dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}