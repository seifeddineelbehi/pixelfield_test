// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/db_config/cached_db_config.dart' as _i657;
import 'core/network/network_info.dart' as _i75;
import 'features/collection/data/data_source/collection_cached_data_source.dart'
    as _i956;
import 'features/collection/data/data_source/collection_remote_data_source.dart'
    as _i481;
import 'features/collection/data/repositories/collection_repository_impl.dart'
    as _i38;
import 'features/collection/presentation/bloc/collection_bloc.dart' as _i292;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i75.NetworkInfoImpl>(() => _i75.NetworkInfoImpl());
    gh.factory<_i481.CollectionRemoteDataSource>(
        () => _i481.CollectionRemoteDataSource());
    gh.singleton<_i657.Database>(() => _i657.Database());
    gh.factory<_i956.CollectionCachedDataSource>(
        () => _i956.CollectionCachedDataSource(gh<_i657.Database>()));
    gh.factory<_i38.CollectionRepositoryImpl>(
        () => _i38.CollectionRepositoryImpl(
              remoteDataSource: gh<_i481.CollectionRemoteDataSource>(),
              cachedDataSource: gh<_i956.CollectionCachedDataSource>(),
              networkInfoImpl: gh<_i75.NetworkInfoImpl>(),
            ));
    gh.factory<_i292.CollectionBloc>(() => _i292.CollectionBloc(
        collectionRepositoryImpl: gh<_i38.CollectionRepositoryImpl>()));
    return this;
  }
}
