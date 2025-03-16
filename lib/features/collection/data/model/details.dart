import 'dart:convert';

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

String detailsToJson(Details data) => json.encode(data.toJson());

class Details {
  Details({
    this.distillery,
    this.region,
    this.country,
    this.type,
    this.ageStatement,
    this.filled,
    this.bottled,
    this.caskNumber,
    this.abv,
    this.size,
    this.finish,
  });

  Details.fromJson(dynamic json) {
    distillery = json['distillery'];
    region = json['region'];
    country = json['country'];
    type = json['type'];
    ageStatement = json['ageStatement'];
    filled = json['filled'];
    bottled = json['bottled'];
    caskNumber = json['caskNumber'];
    abv = json['abv'];
    size = json['size'];
    finish = json['finish'];
  }

  String? distillery;
  String? region;
  String? country;
  String? type;
  String? ageStatement;
  String? filled;
  String? bottled;
  String? caskNumber;
  String? abv;
  String? size;
  String? finish;

  Details copyWith({
    String? distillery,
    String? region,
    String? country,
    String? type,
    String? ageStatement,
    String? filled,
    String? bottled,
    String? caskNumber,
    String? abv,
    String? size,
    String? finish,
  }) => Details(
    distillery: distillery ?? this.distillery,
    region: region ?? this.region,
    country: country ?? this.country,
    type: type ?? this.type,
    ageStatement: ageStatement ?? this.ageStatement,
    filled: filled ?? this.filled,
    bottled: bottled ?? this.bottled,
    caskNumber: caskNumber ?? this.caskNumber,
    abv: abv ?? this.abv,
    size: size ?? this.size,
    finish: finish ?? this.finish,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['distillery'] = distillery;
    map['region'] = region;
    map['country'] = country;
    map['type'] = type;
    map['ageStatement'] = ageStatement;
    map['filled'] = filled;
    map['bottled'] = bottled;
    map['caskNumber'] = caskNumber;
    map['abv'] = abv;
    map['size'] = size;
    map['finish'] = finish;
    return map;
  }
}
