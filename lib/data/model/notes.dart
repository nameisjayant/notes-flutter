import 'package:hive/hive.dart';
part 'notes.g.dart';
@HiveType(typeId: 0)
class Notes {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;

  const Notes(this.title, this.description);
}
