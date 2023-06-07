abstract class Event {
  final String id;
  final String name;
  final String imageUrl;
  Event({
    required this.id,
    this.name = '',
    this.imageUrl = '',
  });
}

// Now we are displaying movies later there can be 
// shows, sports events, ad events etc. Then the same
// class can be extended for those respective objects.
