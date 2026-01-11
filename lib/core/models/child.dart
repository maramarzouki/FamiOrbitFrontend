// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Phone {
  String number;
  bool verified;
  DateTime? addedAt;

  Phone({required this.number, this.verified = false, this.addedAt});

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      number: map['number'] as String,
      verified: map['verified'] as bool,
      addedAt: map['addedAt'] != null
          ? DateTime.parse(map['addedAt'] as String)
          : null,
    );
  }
}

class Child {
  String? id;
  String childUsername;
  List<Phone>? trustedContacts;
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
      id: map['_id'] != null ? map['_id'] as String : null,
      childUsername: map['childUsername'] as String,
      trustedContacts: map['trustedContacts'] != null
          ? (map['trustedContacts'] as List<dynamic>)
                .map((item) => Phone.fromMap(item as Map<String, dynamic>))
                .toList()
          : null,
      safePlaces: map['safePlaces'] != null
          ? List<String>.from((map['safePlaces'] as List<dynamic>))
          : null,
      parentID: map['parentID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Child.fromJson(String source) =>
      Child.fromMap(json.decode(source) as Map<String, dynamic>);

  Child copyWith({
    String? id,
    String? childUsername,
    List<Phone>? trustedContacts,
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
