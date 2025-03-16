import 'package:dartz/dartz.dart';
import 'package:pixelfield_test/core/error/failures.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';

abstract class CollectionRepository {
  Future<Either<Failure, List<BottleModel>>> getCollectionBottles(
      {required int id});
}
