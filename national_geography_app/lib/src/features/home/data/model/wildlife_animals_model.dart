import 'dart:convert';

List<WildlifeAnimalModel> wildlifeAnimalModelFromJson(String str) => List<WildlifeAnimalModel>.from(json.decode(str).map((x) => WildlifeAnimalModel.fromJson(x)));

String wildlifeAnimalModelToJson(List<WildlifeAnimalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WildlifeAnimalModel {
    final String title;
    final String image;
    final DateTime publishedAt;
    final String author;
    final String story;

    WildlifeAnimalModel({
        required this.title,
        required this.image,
        required this.publishedAt,
        required this.author,
        required this.story,
    });

    factory WildlifeAnimalModel.fromJson(Map<String, dynamic> json) => WildlifeAnimalModel(
        title: json["title"],
        image: json["image"],
        publishedAt: DateTime.parse(json["published_at"]),
        author: json["author"],
        story: json["story"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "published_at": publishedAt.toIso8601String(),
        "author": author,
        "story": story,
    };
}
