import 'package:national_geography_app/src/core/either/either.dart';
import 'package:national_geography_app/src/features/home/data/model/wildlife_animals_model.dart';

abstract class HomeRepository {
  Future<Either<String, List<WildlifeAnimalModel>>> getWildlifeAnimals();
}
