// ignore_for_file: unused_import

library cached_db_config;

// For more information on using drift, please see https://drift.simonbinder.eu/docs/getting-started/
// A full cross-platform example is available here: https://github.com/simolus3/drift/tree/develop/examples/app

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'connection/connection.dart' as impl;

part 'cached_db_config.g.dart';

// For more information on using drift, please see https://drift.simonbinder.eu/docs/getting-started/
// A full cross-platform example is available here: https://github.com/simolus3/drift/tree/develop/examples/app

@DataClassName('collectionListTable')
class CollectionListTable extends Table {
  TextColumn get id => text().named('id')();

  TextColumn get bottleName => text().named('bottleName')();

  TextColumn get bottleImage => text().named('bottleImage')();

  TextColumn get bottleProdYear => text().named('bottleProdYear')();

  TextColumn get bottleRef => text().named('bottleRef')();

  TextColumn get bottleNum => text().named('bottleNum')();

  TextColumn get phoneNumber => text().named('phoneNumber')();

  TextColumn get details => text().named('details')();

  TextColumn get personalTastingNote => text().named('personalTastingNote')();

  TextColumn get otherTastingNotes => text().named('otherTastingNotes')();

  TextColumn get history => text().named('history')();

  TextColumn get collection => text().named('collection')();

  BoolColumn get opened => boolean().named('opened')();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@singleton
@DriftDatabase(tables: [
  CollectionListTable,
])
class Database extends _$Database {
  Database() : super(impl.connect());

  @override
  int get schemaVersion => 1;
}
