import 'dart:convert';
import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:pixelfield_test/core/db_config/cached_db_config.dart';
import 'package:pixelfield_test/core/error/exceptions.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';
import 'package:pixelfield_test/features/collection/data/model/details.dart';
import 'package:pixelfield_test/features/collection/data/model/history.dart';
import 'package:pixelfield_test/features/collection/data/model/other_tasting_notes.dart';
import 'package:pixelfield_test/features/collection/data/model/personal_tasting_note.dart';

@injectable
@singleton
class CollectionCachedDataSource {
  final Database cachedDB;

  CollectionCachedDataSource(this.cachedDB);

  Future<void> addCollectionListToCache(
      {required List<BottleModel> listBottles}) async {
    try {
      cachedDB.batch(
        (batch) {
          batch.insertAll(
            cachedDB.collectionListTable,
            mode: InsertMode.insertOrReplace,
            listBottles.map(
              (bottle) => CollectionListTableCompanion.insert(
                id: bottle.id!,
                phoneNumber: bottle.phoneNumber!,
                bottleImage: bottle.bottleImage!,
                bottleName: bottle.bottleName!,
                bottleNum: bottle.bottleNum!,
                bottleProdYear: bottle.bottleProdYear!,
                bottleRef: bottle.bottleRef!,
                collection: bottle.collection!,
                details: json.encode(bottle.details?.toJson()).toString(),
                history: json
                    .encode(bottle.history!.map((e) => e.toJson()).toList())
                    .toString(),
                opened: bottle.opened!,
                otherTastingNotes:
                    json.encode(bottle.otherTastingNotes?.toJson()).toString(),
                personalTastingNote: json
                    .encode(bottle.personalTastingNote?.toJson())
                    .toString(),
              ),
            ),
          );
        },
      );
    } catch (e, s) {
      log('error: $e, stack: $s');
      rethrow;
    }
  }

  Future<List<BottleModel>> fetchCachedCollectionList() async {
    try {
      final List<collectionListTable> allData =
          await cachedDB.select(cachedDB.collectionListTable).get();

      ///exception to stop the process in case table is empty
      if (allData.isEmpty) {
        throw EmptyCacheException();
      }
      List<BottleModel> bottleList = [];
      for (final bottle in allData) {
        BottleModel bottleModel = BottleModel(
          personalTastingNote: PersonalTastingNote.fromJson(
              json.decode(bottle.personalTastingNote)),
          otherTastingNotes:
              OtherTastingNotes.fromJson(json.decode(bottle.otherTastingNotes)),
          history: (json.decode(bottle.history) as List<dynamic>)
              .map((e) => History.fromJson(e))
              .toList(),
          details: Details.fromJson(json.decode(bottle.details)),
          opened: bottle.opened,
          collection: bottle.collection,
          bottleRef: bottle.bottleRef,
          bottleProdYear: bottle.bottleProdYear,
          bottleNum: bottle.bottleNum,
          bottleName: bottle.bottleName,
          bottleImage: bottle.bottleImage,
          phoneNumber: bottle.phoneNumber,
          id: bottle.id,
        );

        bottleList.add(bottleModel);
      }

      return bottleList;
    } catch (e, s) {
      log('error: $e, stack: $s');
      rethrow;
    }
  }
}
