import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:national_geography_app/src/features/home/data/model/wildlife_animals_model.dart';

abstract class HomeDataSource {
  Future<List<WildlifeAnimalModel>> getWildlifeAnimals();
}

class HomeDataSourceImpl extends HomeDataSource {
  final Dio _dio;

  HomeDataSourceImpl({required Dio dio}) : _dio = dio;
  @override
  Future<List<WildlifeAnimalModel>> getWildlifeAnimals() async {
    try {
      Response response = await _dio.get('http://192.168.1.31:8000/wildlife');

      if (response.statusCode != null && response.statusCode == 200) {
        return (jsonDecode(response.data) as List).map((json) => WildlifeAnimalModel.fromJson(json)).toList();
      }

      throw Exception(response.statusMessage);
    } catch (e) {
      rethrow;
    }
  }
}
