import 'dart:convert';

import 'details.dart';
import 'history.dart';
import 'other_tasting_notes.dart';
import 'personal_tasting_note.dart';

BottleModel bottleModelFromJson(String str) =>
    BottleModel.fromJson(json.decode(str));

String bottleModelToJson(BottleModel data) => json.encode(data.toJson());

class BottleModel {
  BottleModel({
    this.id,
    this.bottleName,
    this.bottleImage,
    this.bottleProdYear,
    this.bottleRef,
    this.bottleNum,
    this.phoneNumber,
    this.details,
    this.personalTastingNote,
    this.otherTastingNotes,
    this.history,
    this.collection,
    this.opened,
  });

  BottleModel.fromJson(dynamic json) {
    id = json['id'];
    bottleName = json['bottleName'];
    bottleImage = json['bottleImage'];
    bottleProdYear = json['bottleProdYear'];
    bottleRef = json['bottleRef'];
    bottleNum = json['bottleNum'];
    phoneNumber = json['phoneNumber'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
    personalTastingNote = json['personalTastingNote'] != null
        ? PersonalTastingNote.fromJson(json['personalTastingNote'])
        : null;
    otherTastingNotes = json['otherTastingNotes'] != null
        ? OtherTastingNotes.fromJson(json['otherTastingNotes'])
        : null;
    if (json['history'] != null) {
      history = [];
      json['history'].forEach((v) {
        history?.add(History.fromJson(v));
      });
    }
    collection = json['collection'];
    opened = json['opened'];
  }

  String? id;
  String? bottleName;
  String? bottleImage;
  String? bottleProdYear;
  String? bottleRef;
  String? bottleNum;
  String? phoneNumber;
  Details? details;
  PersonalTastingNote? personalTastingNote;
  OtherTastingNotes? otherTastingNotes;
  List<History>? history;
  String? collection;
  bool? opened;

  BottleModel copyWith({
    String? id,
    String? bottleName,
    String? bottleImage,
    String? bottleProdYear,
    String? bottleRef,
    String? bottleNum,
    String? phoneNumber,
    Details? details,
    PersonalTastingNote? personalTastingNote,
    OtherTastingNotes? otherTastingNotes,
    List<History>? history,
    String? collection,
    bool? opened,
  }) =>
      BottleModel(
        id: id ?? this.id,
        bottleName: bottleName ?? this.bottleName,
        bottleImage: bottleImage ?? this.bottleImage,
        bottleProdYear: bottleProdYear ?? this.bottleProdYear,
        bottleRef: bottleRef ?? this.bottleRef,
        bottleNum: bottleNum ?? this.bottleNum,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        details: details ?? this.details,
        personalTastingNote: personalTastingNote ?? this.personalTastingNote,
        otherTastingNotes: otherTastingNotes ?? this.otherTastingNotes,
        history: history ?? this.history,
        collection: collection ?? this.collection,
        opened: opened ?? this.opened,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['bottleName'] = bottleName;
    map['bottleImage'] = bottleImage;
    map['bottleProdYear'] = bottleProdYear;
    map['bottleRef'] = bottleRef;
    map['bottleNum'] = bottleNum;
    map['phoneNumber'] = phoneNumber;
    if (details != null) {
      map['details'] = details?.toJson();
    }
    if (personalTastingNote != null) {
      map['personalTastingNote'] = personalTastingNote?.toJson();
    }
    if (otherTastingNotes != null) {
      map['otherTastingNotes'] = otherTastingNotes?.toJson();
    }
    if (history != null) {
      map['history'] = history?.map((v) => v.toJson()).toList();
    }
    map['collection'] = collection;
    map['opened'] = opened;
    return map;
  }
}
