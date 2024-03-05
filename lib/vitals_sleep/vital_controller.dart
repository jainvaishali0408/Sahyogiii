import 'package:sahyogii/src/infra/health_repository.dart';
import 'package:sahyogii/src/models/vital.dart';
import 'package:flutter/material.dart';

class HomeController {
  final repository = HealthRepository();
  //Future<void> getDataFirebase() async {
  //  final moviesRef = FirebaseFirestore.instance
  //      .collection('movies')
  //      .withConverter<Movie>(
  //          fromFirestore: (snapshots, _) => Movie.fromJson(snapshots.data()!),
  //          toFirestore: (movie, _) => movie.toJson());

  //  final movies = await moviesRef.get();

  //  print(movies.docs.map((e) => e.data()).toList());
  //}

  final vital = ValueNotifier(<Vital>[]);
  Future<void> getData() async {
    vital.value = await repository.getVital();
  }
}

class Movie {
  final int id;
  final String name;
  final String value;

  Movie(this.id, this.name, this.value);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'] as int,
      json['name'] as String,
      json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'name': name, 'value': value};
}
