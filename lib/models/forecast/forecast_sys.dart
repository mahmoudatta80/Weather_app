class Sys {
  late final String pod;

  Sys.fromJson(Map<String , dynamic> json) {
    pod = json['pod'];
  }
}