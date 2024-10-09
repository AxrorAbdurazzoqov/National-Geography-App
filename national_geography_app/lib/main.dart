import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:national_geography_app/src/features/home/data/data_source/home_data_source.dart';
import 'package:national_geography_app/src/features/home/data/repository/home_repository_impl.dart';
import 'package:national_geography_app/src/features/home/domain/usecase/get_wildlife_animals_usecase.dart';
import 'package:national_geography_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:national_geography_app/src/features/home/presentation/screen/home_screen.dart';

void main() {
  final Dio dio = Dio();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc(getWildlifeAnimalsUsecase: GetWildlifeAnimalsUsecase(repository: HomeRepositoryImpl(dataSource: HomeDataSourceImpl(dio: dio))))),
      ],
      child: const NationalGeographic(),
    ),
  );
}

class NationalGeographic extends StatelessWidget {
  const NationalGeographic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'National Geography App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
