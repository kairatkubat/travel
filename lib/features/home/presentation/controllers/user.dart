import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  /// Consutructor
  const User({
    required this.name,
    required this.age,
  });

  ///Fields
  final String name;
  final int age;

  ///This method for change value of Fields
  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  /// Fields To Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  /// From Map To User Model
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  /// From User Model To Json
  String toJson() => json.encode(toMap());

  /// Form Json to User Model
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, age: $age)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

/// State Manager
class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(const User(name: '', age: 0));

  /// Method to change name in User Model.
  void updateName(String value) {
    state = state.copyWith(name: value);
  }
}
