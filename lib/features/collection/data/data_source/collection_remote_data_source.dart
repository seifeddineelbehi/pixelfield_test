import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';

/// This class is a singleton and can be injected as a dependency.
@injectable
@singleton
class CollectionRemoteDataSource {
  /// Loads and returns a list of collection bottles from a local JSON file.
  Future<List<BottleModel>> getCollectionBottles(
      {required int id, http.Client? client}) async {
    final String response =
        await rootBundle.loadString('data_samples/collection.json');
    final List<dynamic> jsonData = json.decode(response);
    final List<BottleModel> data =
        jsonData.map((json) => BottleModel.fromJson(json)).toList();
    return data;
  }
}
