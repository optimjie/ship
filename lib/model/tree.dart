final String tableTree = 'tree';

class TreeFields {
  // required this.id,
  // required this.parentId,
  // required this.name,
  // required this.extras

  static final List<String> values = [
    /// Add all fields
    id, parentId, name, extras
  ];

  static final String id = '_id';
  static final String parentId = 'parentId';
  static final String name = 'name';
  static final String extras = 'extras';
}

class Tree {
  final int? id;
  final int parentId;
  final String name;
  final String extras;

  const Tree(
      {this.id,
      required this.parentId,
      required this.name,
      required this.extras});
  Tree copy({
    int? id,
    int? parentId,
    String? name,
    String? extras,
  }) =>
      Tree(
          id: id ?? this.id,
          parentId: parentId ?? this.parentId,
          name: name ?? this.name,
          extras: extras ?? this.extras);
  static Tree fromJson(Map<String, Object?> json) => Tree(
        id: json[TreeFields.id] as int?,
        parentId: json[TreeFields.parentId] as int,
        name: json[TreeFields.name] as String,
        extras: json[TreeFields.extras] as String,
      );
  Map<String, Object?> toJson() => {
        TreeFields.id: id,
        TreeFields.parentId: parentId,
        TreeFields.name: name,
        TreeFields.extras: extras,
      };
}
