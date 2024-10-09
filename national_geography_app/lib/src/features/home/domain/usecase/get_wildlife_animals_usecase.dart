import 'package:national_geography_app/src/core/either/either.dart';
import 'package:national_geography_app/src/core/usecase/usecase.dart';
import 'package:national_geography_app/src/features/home/data/model/wildlife_animals_model.dart';
import 'package:national_geography_app/src/features/home/domain/repository/home_repository.dart';

class GetWildlifeAnimalsUsecase extends UseCase<List<WildlifeAnimalModel>,NoParams> {
  final HomeRepository _repository;

  GetWildlifeAnimalsUsecase({required HomeRepository repository}) : _repository = repository;
  @override
  Future<Either<String, List<WildlifeAnimalModel>>> call(NoParams params) async => await _repository.getWildlifeAnimals();
}
