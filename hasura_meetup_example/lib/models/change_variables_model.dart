import 'dart:convert';

class VariablesModel {
  String orderBy;
  String name;
  VariablesModel({
    required this.orderBy,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'order_by': orderBy,
      'name': '%$name%',
    };
  }

  factory VariablesModel.fromMap(Map<String, dynamic> map) {
    return VariablesModel(
      orderBy: map['order_by'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VariablesModel.fromJson(String source) =>
      VariablesModel.fromMap(json.decode(source));

  VariablesModel copyWith({
    String? orderBy,
    String? name,
  }) {
    return VariablesModel(
      orderBy: orderBy ?? this.orderBy,
      name: name ?? this.name,
    );
  }
}
