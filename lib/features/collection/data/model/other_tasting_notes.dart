import 'dart:convert';

OtherTastingNotes otherTastingNotesFromJson(String str) =>
    OtherTastingNotes.fromJson(json.decode(str));

String otherTastingNotesToJson(OtherTastingNotes data) =>
    json.encode(data.toJson());

class OtherTastingNotes {
  OtherTastingNotes({
    this.doneBy,
    this.noseDesc,
    this.palateDesc,
    this.finishDesc,
  });

  OtherTastingNotes.fromJson(dynamic json) {
    doneBy = json['doneBy'];
    noseDesc = json['noseDesc'];
    palateDesc = json['palateDesc'];
    finishDesc = json['finishDesc'];
  }

  String? doneBy;
  String? noseDesc;
  String? palateDesc;
  String? finishDesc;

  OtherTastingNotes copyWith({
    String? doneBy,
    String? noseDesc,
    String? palateDesc,
    String? finishDesc,
  }) => OtherTastingNotes(
    doneBy: doneBy ?? this.doneBy,
    noseDesc: noseDesc ?? this.noseDesc,
    palateDesc: palateDesc ?? this.palateDesc,
    finishDesc: finishDesc ?? this.finishDesc,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doneBy'] = doneBy;
    map['noseDesc'] = noseDesc;
    map['palateDesc'] = palateDesc;
    map['finishDesc'] = finishDesc;
    return map;
  }
}
