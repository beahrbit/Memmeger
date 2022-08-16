import 'package:intl/intl.dart';

class Event {
  static final DateFormat dbDateFormat = DateFormat('yyyy-MM-dd');

  static const dbEventId = "id";
  static const dbEventTitle = "title";
  static const dbEventDate = "date";
  static const dbEventLocation = "location";
  static const dbEventDescription = "description";

  final String _id;
  String _title;
  DateTime date;
  String location;
  String description;

  Event(this._id, this._title, this.date, this.location, this.description);

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      json[dbEventId] as String,
      json[dbEventTitle] as String,
      dbDateFormat.parseStrict(json[dbEventDate] as String),
      json[dbEventLocation] as String,
      json[dbEventDescription] as String,
    );
  }

  String get id => _id;

  String get title => _title;
  set title(String title) {
    if (title == "") return;
    _title = title;
  }
}
