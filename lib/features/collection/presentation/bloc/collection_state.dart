part of 'collection_bloc.dart';

abstract class CollectionState extends Equatable {
  const CollectionState();

  @override
  List<Object> get props => [];
}

class CollectionInitial extends CollectionState {}

class LoadingCollectionState extends CollectionState {}

class LoadedCollectionState extends CollectionState {
  final List<BottleModel> bottles;

  const LoadedCollectionState({required this.bottles});

  @override
  List<Object> get props => [bottles];
}

class ErrorCollectionState extends CollectionState {
  final String message;

  const ErrorCollectionState({required this.message});

  @override
  List<Object> get props => [message];
}
