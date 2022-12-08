// Pub
import 'package:hive/hive.dart';

part 'event.g.dart';

@HiveType(typeId: 0)
class Event extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late int imageIndex;

  @HiveField(2)
  late DateTime targetDate;

  @HiveField(3)
  late DateTime createdDate;
}