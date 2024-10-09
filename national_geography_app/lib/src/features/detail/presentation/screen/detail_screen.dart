import 'package:flutter/material.dart';
import 'package:national_geography_app/src/core/constants/colors/app_colors.dart';
import 'package:national_geography_app/src/core/extensions/context_theme.dart';
import 'package:national_geography_app/src/core/extensions/get_mediaquery_size.dart';
import 'package:national_geography_app/src/features/home/data/model/wildlife_animals_model.dart';

class DetailScreen extends StatelessWidget {
  final WildlifeAnimalModel model;

  const DetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: context.getHeight * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(model.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: context.getHeight * 0.3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.instance.white,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                width: context.getWidth,
                bottom: 0,
                left: 10,
                child: Text(
                  model.title,
                  style: context.textTheme.titleLarge?.copyWith(color: Colors.black),
                ),
              ),
              Positioned(
                top: context.getHeight * 0.05,
                left: context.getWidth * 0.05,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.instance.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    iconSize: 36,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.chevron_left_sharp),
                  ),
                ),
              ),
            ],
          ),
          const Divider(thickness: 0.8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("PUBLISHED ${model.publishedAt.month} ${model.publishedAt.day.toString().padLeft(2, '0')} ${model.publishedAt.year}\n•"),
                    Text("By ${model.author}"),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    text: model.story.substring(0, 1),
                    style: context.textTheme.displayLarge,
                    children: <InlineSpan>[
                      TextSpan(text: model.story.substring(1), style: context.textTheme.bodyLarge),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
