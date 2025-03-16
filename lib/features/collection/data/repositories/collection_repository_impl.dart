import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pixelfield_test/core/error/exceptions.dart';
import 'package:pixelfield_test/core/error/failures.dart';
import 'package:pixelfield_test/core/network/network_info.dart';
import 'package:pixelfield_test/features/collection/data/data_source/collection_cached_data_source.dart';
import 'package:pixelfield_test/features/collection/data/data_source/collection_remote_data_source.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';
import 'package:pixelfield_test/features/collection/domain/repositories/collection_repository.dart';

@injectable
@singleton
class CollectionRepositoryImpl implements CollectionRepository {
  final CollectionRemoteDataSource remoteDataSource;

  final CollectionCachedDataSource cachedDataSource;
  final NetworkInfoImpl networkInfoImpl;

  CollectionRepositoryImpl({
    required this.remoteDataSource,
    required this.cachedDataSource,
    required this.networkInfoImpl,
  });

  @override
  Future<Either<Failure, List<BottleModel>>> getCollectionBottles(
      {required int id}) async {
    bool isConnected = await networkInfoImpl.isConnected();
    if (isConnected) {
      try {
        final remoteCollection =
            await remoteDataSource.getCollectionBottles(id: id);
        cachedDataSource.addCollectionListToCache(
            listBottles: remoteCollection);
        return Right(remoteCollection);
      } on SocketException {
        log('internet connection error');
        return left(ServerFailure());
      }
    } else {
      try {
        final localCollection =
            await cachedDataSource.fetchCachedCollectionList();
        return Right(localCollection);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
