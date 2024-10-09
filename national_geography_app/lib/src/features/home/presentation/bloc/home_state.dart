part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<WildlifeAnimalModel> data;

  const HomeSuccess({required this.data});

  @override
  List<Object> get props => [
        data
      ];
}

final class HomeFailure extends HomeState {
  final String errorMessage;

  const HomeFailure({required this.errorMessage});

  @override
  List<Object> get props => [
        errorMessage
      ];
}
