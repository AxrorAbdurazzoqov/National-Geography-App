import 'package:flutter/material.dart';

class AppColors {
  static AppColors get instance => _instance;
  static final AppColors _instance = AppColors.init();
  AppColors.init();

  final Color white = const Color(0xffFFFFFF);
  final Color black = const Color(0xff1E1E1E);
}