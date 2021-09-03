import 'dart:convert';

class UserModel {
  String email;
  String name;
  String cpf;
  String uid;
  UserModel({
    required this.email,
    required this.name,
    required this.cpf,
    required this.uid,
  });

  UserModel copyWith({
    String? email,
    String? name,
    String? cpf,
    String? uid,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'cpf': cpf,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      name: map['name'],
      cpf: map['cpf'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, cpf: $cpf, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.email == email &&
      other.name == name &&
      other.cpf == cpf &&
      other.uid == uid;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      name.hashCode ^
      cpf.hashCode ^
      uid.hashCode;
  }
}
