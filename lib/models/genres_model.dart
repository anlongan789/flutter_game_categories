// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  final int? id;
  final String? name;
  final String? imagBackground;
  Genres({
    this.id,
    this.name,
    this.imagBackground,
  });

  @override
  List<Object?> get props => [id, name, imagBackground];

  Genres copyWith({
    int? id,
    String? name,
    String? imagBackground,
  }) {
    return Genres(
      id: id ?? this.id,
      name: name ?? this.name,
      imagBackground: imagBackground ?? this.imagBackground,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imagBackground': imagBackground,
    };
  }

  factory Genres.fromMap(Map<String, dynamic> map) {
    return Genres(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      imagBackground: map['imagBackground'] != null
          ? map['imagBackground'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Genres.fromJson(String source) =>
      Genres.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
