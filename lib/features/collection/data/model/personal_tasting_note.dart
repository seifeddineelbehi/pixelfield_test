import 'dart:convert';

PersonalTastingNote personalTastingNoteFromJson(String str) => PersonalTastingNote.fromJson(json.decode(str));
String personalTastingNoteToJson(PersonalTastingNote data) => json.encode(data.toJson());
class PersonalTastingNote {
  PersonalTastingNote({
      this.noseDesc, 
      this.palateDesc, 
      this.finishDesc,});

  PersonalTastingNote.fromJson(dynamic json) {
    noseDesc = json['noseDesc'];
    palateDesc = json['palateDesc'];
    finishDesc = json['finishDesc'];
  }
  String? noseDesc;
  String? palateDesc;
  String? finishDesc;
PersonalTastingNote copyWith({  String? noseDesc,
  String? palateDesc,
  String? finishDesc,
}) => PersonalTastingNote(  noseDesc: noseDesc ?? this.noseDesc,
  palateDesc: palateDesc ?? this.palateDesc,
  finishDesc: finishDesc ?? this.finishDesc,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['noseDesc'] = noseDesc;
    map['palateDesc'] = palateDesc;
    map['finishDesc'] = finishDesc;
    return map;
  }

}