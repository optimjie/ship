import 'package:dynamic_treeview/dynamic_treeview.dart';

final String tableLedger = 'equipment';

class LedgerFields {

  static final List<String> values = [
    id, name, location, category
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String location = 'location';
  static final String category = 'category';
}

class Ledger {
  final int? id;
  final String name;
  final String location;
  final String category;

  Ledger({
    this.id,
    required this.name,
    required this.location,
    required this.category
  });
  Ledger copy({
    int? id,
    String? name,
    String? location,
    String? category,
  }) =>
    Ledger(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      category: category ?? this.category
    );
  static Ledger fromJson(Map<String, Object?> json) => Ledger(
    id: json[LedgerFields.id] as int?,
    name: json[LedgerFields.name] as String,
    location: json[LedgerFields.location] as String,
    category: json[LedgerFields.category] as String,
  );
  Map<String, Object?> toJson() => {
    LedgerFields.id: id,
    LedgerFields.name: name,
    LedgerFields.location: location,
    LedgerFields.category: category,
  };
}