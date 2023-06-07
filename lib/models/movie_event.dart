import 'package:uuid/uuid.dart';

import 'event.dart';

class MovieEvent extends Event {
  //Based on the data we can add movie specific values.
  MovieEvent({required super.id, super.name, super.imageUrl});

  factory MovieEvent.fromjson(Map<String, dynamic> json) => MovieEvent(
        id: const Uuid().v4(),
        imageUrl: json['coverUrl'],
        name: json['title'],
      );
}
