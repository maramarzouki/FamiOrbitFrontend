// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Child {
  int? id;
  String childUsername;
  List<int>? phoneNumbers;
  List<String>? savedPlaces;
  int parentID;

  Child({
    this.id,
    required this.childUsername,
    this.phoneNumbers,
    this.savedPlaces,
    required this.parentID,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'childUsername': childUsername,
      'phoneNumbers': phoneNumbers,
      'savedPlaces': savedPlaces,
      'parentID': parentID,
    };
  }

  factory Child.fromMap(Map<String, dynamic> map) {
    return Child(
      id: map['id'] != null ? map['id'] as int : null,
      childUsername: map['childUsername'] as String,
      phoneNumbers: map['phoneNumbers'] != null ? List<int>.from((map['phoneNumbers'] as List<int>)) : null,
      savedPlaces: map['savedPlaces'] != null ? List<String>.from((map['savedPlaces'] as List<String>)) : null,
      parentID: map['parentID'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Child.fromJson(String source) => Child.fromMap(json.decode(source) as Map<String, dynamic>);

  Child copyWith({
    int? id,
    String? childUsername,
    List<int>? phoneNumbers,
    List<String>? savedPlaces,
    int? parentID,
  }) {
    return Child(
      id: id ?? this.id,
      childUsername: childUsername ?? this.childUsername,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      savedPlaces: savedPlaces ?? this.savedPlaces,
      parentID: parentID ?? this.parentID,
    );
  }

  @override
  String toString() {
    return 'Child(id: $id, childUsername: $childUsername, phoneNumbers: $phoneNumbers, savedPlaces: $savedPlaces, parentID: $parentID)';
  }
}
