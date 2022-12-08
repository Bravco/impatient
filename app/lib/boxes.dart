// Pub
import 'package:hive/hive.dart';

// Model
import 'package:app/model/event.dart';

class Boxes {
  static Box<Event> getEvents() => Hive.box<Event>("events");
}