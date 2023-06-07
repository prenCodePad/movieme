import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../pages.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  const EventWidget({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (event.runtimeType) {
      case MovieEvent:
        return MovieEventWidget(event: event as MovieEvent);
      default:
        return MovieEventWidget(event: event as MovieEvent);
    }
  }
}
