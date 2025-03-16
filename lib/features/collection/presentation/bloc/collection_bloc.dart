import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pixelfield_test/core/error/failures.dart';
import 'package:pixelfield_test/core/strings/failures.dart';
import 'package:pixelfield_test/features/collection/data/model/bottle_model.dart';
import 'package:pixelfield_test/features/collection/data/repositories/collection_repository_impl.dart';

part 'collection_event.dart';

part 'collection_state.dart';

/// This class defines the State Management for Posts.
@injectable
@singleton
class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionRepositoryImpl collectionRepositoryImpl;

  CollectionBloc({
    required this.collectionRepositoryImpl,
  }) : super(CollectionInitial()) {
    on<CollectionEvent>((event, emit) async {
      if (event is GetAllCollectionEvent) {
        emit(LoadingCollectionState());

        final failureOrCollection =
            await collectionRepositoryImpl.getCollectionBottles(id: 0);
        emit(_mapFailureOrPostsToState(failureOrCollection));
      } else if (event is RefreshCollectionEvent) {
        emit(LoadingCollectionState());

        final failureOrCollection =
            await collectionRepositoryImpl.getCollectionBottles(id: 0);
        emit(_mapFailureOrPostsToState(failureOrCollection));
      }
    });
  }

  CollectionState _mapFailureOrPostsToState(
      Either<Failure, List<BottleModel>> either) {
    return either.fold(
      (failure) => ErrorCollectionState(message: _mapFailureToMessage(failure)),
      (bottles) => LoadedCollectionState(
        bottles: bottles,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
