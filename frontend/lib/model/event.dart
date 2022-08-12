class Event {
  final String _id;
  String _title;
  String date;
  String location;
  String description;

  Event(this._id, this._title, this.date, this.location, this.description);

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      json["id"] as String,
      json["title"] as String,
      json["date"] as String,
      json["location"] as String,
      json["description"] as String,
    );
  }

  String get id => _id;

  String get title => _title;
  set title(String title) {
    if (title == "") return;
    _title = title;
  }
}
