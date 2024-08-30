import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    var date = DateTime.parse(json);
    return date.isUtc ? date.toLocal() : date;
  }

  @override
  String toJson(DateTime dateTime) {
    return dateTime.toIso8601String();
  }
}
