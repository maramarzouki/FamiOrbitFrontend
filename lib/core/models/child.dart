// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Child {
  int? id;
  String childUsername;
  List<int>? trustedContacts;
  List<String>? safePlaces;
  String parentID;

  Child({
    this.id,
    required this.childUsername,
    this.trustedContacts,
    this.safePlaces,
    required this.parentID,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'childUsername': childUsername,
      'trustedContacts': trustedContacts,
      'safePlaces': safePlaces,
      'parentID': parentID,
    };
  }

  factory Child.fromMap(Map<String, dynamic> map) {
    return Child(
      id: map['_id'] != null ? map['_id'] as int : null,
      childUsername: map['childUsername'] as String,
      trustedContacts: map['trustedContacts'] != null ? List<int>.from((map['trustedContacts'] as List<dynamic>)) : null,
      safePlaces: map['safePlaces'] != null ? List<String>.from((map['safePlaces'] as List<dynamic>)) : null,
      parentID: map['parentID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Child.fromJson(String source) => Child.fromMap(json.decode(source) as Map<String, dynamic>);
  factory Child.fromJson(dynamic source) {  // Updated to handle String or Map
    if (source is String) {
      return Child.fromMap(json.decode(source) as Map<String, dynamic>);
    } else if (source is Map<String, dynamic>) {
      return Child.fromMap(source);
    } else {
      throw ArgumentError('Invalid source type for fromJson: ${source.runtimeType}');
    }
  }

  Child copyWith({
    int? id,
    String? childUsername,
    List<int>? trustedContacts,
    List<String>? safePlaces,
    String? parentID,
  }) {
    return Child(
      id: id ?? this.id,
      childUsername: childUsername ?? this.childUsername,
      trustedContacts: trustedContacts ?? this.trustedContacts,
      safePlaces: safePlaces ?? this.safePlaces,
      parentID: parentID ?? this.parentID,
    );
  }

  @override
  String toString() {
    return 'Child(id: $id, childUsername: $childUsername, trustedContacts: $trustedContacts, safePlaces: $safePlaces, parentID: $parentID)';
  }
}
