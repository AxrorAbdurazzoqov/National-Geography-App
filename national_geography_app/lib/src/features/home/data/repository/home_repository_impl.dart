import 'package:national_geography_app/src/core/either/either.dart';
import 'package:national_geography_app/src/features/home/data/data_source/home_data_source.dart';
import 'package:national_geography_app/src/features/home/data/model/wildlife_animals_model.dart';
import 'package:national_geography_app/src/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource _dataSource;

  HomeRepositoryImpl({required HomeDataSource dataSource}) : _dataSource = dataSource;
  @override
  Future<Either<String, List<WildlifeAnimalModel>>> getWildlifeAnimals() async {
    try {
      final result = await _dataSource.getWildlifeAnimals();

      return Right(result);
    } catch (e) {
      return Left(e.toString()); 
    }
  }
}
