import 'dart:convert';

History historyFromJson(String str) => History.fromJson(json.decode(str));

String historyToJson(History data) => json.encode(data.toJson());

class History {
  History({this.date, this.title, this.desc, this.attachments});

  History.fromJson(dynamic json) {
    date = json['date'];
    title = json['title'];
    desc = json['desc'];
    attachments =
        json['attachments'] != null ? json['attachments'].cast<String>() : [];
  }

  String? date;
  String? title;
  String? desc;
  List<String>? attachments;

  History copyWith({
    String? date,
    String? title,
    String? desc,
    List<String>? attachments,
  }) => History(
    date: date ?? this.date,
    title: title ?? this.title,
    desc: desc ?? this.desc,
    attachments: attachments ?? this.attachments,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['title'] = title;
    map['desc'] = desc;
    map['attachments'] = attachments;
    return map;
  }
}
