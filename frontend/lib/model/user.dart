class User {
  static const dbUserId = 'userId';
  static const dbUserName = 'username';
  static const dbEmail = 'email';

  final String _id;
  final String _name;
  final String _mail;

  User(this._id, this._name, this._mail);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json[dbUserId],
      json[dbUserName],
      json[dbEmail],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      dbUserId: _id,
      dbUserName: _name,
      dbEmail: _mail,
    };
  }

  String get id => _id;
  String get name => _name;
  String get mail => _mail;
}
