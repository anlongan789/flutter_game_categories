// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final int? id;
  final String? name;
  final String? released;
  final String? backgroundImage;
  final double? rating;
  final List<ShortScreenshot>? shortScreenshots;

  const Game({
    this.id,
    this.name,
    this.released,
    this.backgroundImage,
    this.rating,
    this.shortScreenshots,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      released,
      backgroundImage,
      rating,
      shortScreenshots,
    ];
  }

  @override
  bool get stringify => true;

  Game copyWith({
    int? id,
    String? name,
    String? released,
    String? backgroundImage,
    double? rating,
    List<ShortScreenshot>? shortScreenshots,
  }) {
    return Game(
      id: id ?? this.id,
      name: name ?? this.name,
      released: released ?? this.released,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      rating: rating ?? this.rating,
      shortScreenshots: shortScreenshots ?? this.shortScreenshots,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'released': released,
      'backgroundImage': backgroundImage,
      'rating': rating,
      'shortScreenshots': shortScreenshots!.map((x) => x.toMap()).toList(),
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'] as int,
      name: map['name'] as String,
      released: map['released'] as String,
      backgroundImage: map['background_image'] as String,
      rating: map['rating'] as double,
      shortScreenshots: map['shortScreenshots'] != null
          ? List<ShortScreenshot>.from(
              (map['shortScreenshots'] as List<int>).map<ShortScreenshot?>(
                (x) => ShortScreenshot.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Game.fromJson(String source) =>
      Game.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<Game> games = [
    Game(
      id: 112,
      name: "Marvel Spider-Man",
      released: "2018-10-22",
      backgroundImage:
          "https://img.redbull.com/images/c_crop,w_1920,h_960,x_0,y_0,f_auto,q_auto/c_scale,w_1200/redbullcom/2018/08/07/0344728d-4c18-4c60-8e84-a7b801ddf45a/spider-man-ps4-screenshot",
      rating: 4.3,
      shortScreenshots: [
        ShortScreenshot(
          id: 1,
          image:
              "https://img.redbull.com/images/c_crop,w_1920,h_960,x_0,y_0,f_auto,q_auto/c_scale,w_1200/redbullcom/2018/08/07/0344728d-4c18-4c60-8e84-a7b801ddf45a/spider-man-ps4-screenshot",
        ),
        ShortScreenshot(
          id: 2,
          image:
              "https://genk.mediacdn.vn/139269124445442048/2022/6/3/spidor-1654229242413733568390.png",
        ),
        ShortScreenshot(
          id: 3,
          image: "https://i.ytimg.com/vi/K4zm30yeHHE/maxresdefault.jpg",
        ),
        ShortScreenshot(
          id: 4,
          image:
              "https://www.hollywoodreporter.com/wp-content/uploads/2018/07/spider-man_ps4_preview_swing-h_2018.jpg",
        ),
      ],
    ),
  ];
}

class ShortScreenshot extends Equatable {
  final int? id;
  final String? image;

  ShortScreenshot({
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [id, image];

  ShortScreenshot copyWith({
    int? id,
    String? image,
  }) {
    return ShortScreenshot(
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
    };
  }

  factory ShortScreenshot.fromMap(Map<String, dynamic> map) {
    return ShortScreenshot(
      id: map['id'] != null ? map['id'] as int : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortScreenshot.fromJson(String source) =>
      ShortScreenshot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
