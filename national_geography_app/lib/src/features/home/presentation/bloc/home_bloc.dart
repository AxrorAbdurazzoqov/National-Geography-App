import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:national_geography_app/src/core/usecase/usecase.dart';
import 'package:national_geography_app/src/features/home/data/model/wildlife_animals_model.dart';
import 'package:national_geography_app/src/features/home/domain/usecase/get_wildlife_animals_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetWildlifeAnimalsUsecase getWildlifeAnimalsUsecase;
  HomeBloc({required this.getWildlifeAnimalsUsecase}) : super(HomeInitial()) {
    on<GetWildAnimalsEvent>((event, emit) async {
      final result = await getWildlifeAnimalsUsecase.call(NoParams());
      if (result.isRight) {
        emit(HomeSuccess(data: result.right));
      } else {
        emit(HomeFailure(errorMessage: result.left));
      }
    });
  }
}
