import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';

@injectable
@singleton
class CollectionRemoteDataSource {
  Future<List<BottleModel>> getCollectionBottles(
      {required int id, http.Client? client}) async {
    final String response =
        await rootBundle.loadString('data_samples/collection.json');
    final List<dynamic> jsonData = json.decode(response);
    final List<BottleModel> data =
        jsonData.map((json) => BottleModel.fromJson(json)).toList();
    return data;
    try {} on SocketException {
      log('internet connection error');
      rethrow;
    }
  }
}
