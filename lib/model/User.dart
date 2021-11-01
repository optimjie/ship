import 'package:dynamic_treeview/dynamic_treeview.dart';

final String tableUser = 'user';

class UserFields {

  static final List<String> values = [
    id, name, password, level
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String password = 'password';
  static final String level = 'level';
}

class User {
  final int? id;
  final String name;
  final String password;
  final String level;

  User({
    this.id,
    required this.name,
    required this.password,
    required this.level
  });
  User copy({
    int? id,
    String? name,
    String? password,
    String? level,
  }) =>
    User(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      level: level ?? this.level
    );
  static User fromJson(Map<String, Object?> json) => User(
    id: json[UserFields.id] as int?,
    name: json[UserFields.name] as String,
    password: json[UserFields.password] as String,
    level: json[UserFields.level] as String,
  );
  Map<String, Object?> toJson() => {
    UserFields.id: id,
    UserFields.name: name,
    UserFields.password: password,
    UserFields.level: level,
  };
}