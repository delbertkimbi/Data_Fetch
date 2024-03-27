import 'dart:convert';

class User {
  int? id;
  String firstName;
  String lastName;
  String avatar;
  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'avatar': avatar});
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
