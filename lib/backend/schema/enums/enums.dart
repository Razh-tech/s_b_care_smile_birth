import 'package:collection/collection.dart';

enum DaysofWeek {
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
}

enum TimeZone {
  WIB,
  WITA,
  WIT,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (DaysofWeek):
      return DaysofWeek.values.deserialize(value) as T?;
    case (TimeZone):
      return TimeZone.values.deserialize(value) as T?;
    default:
      return null;
  }
}
