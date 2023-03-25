// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String id;
  final String iduser;
  final String prefix;
  final String firstname;
  final String lastname;
  final String type;
  final String user;
  final String password;
  UserModel({
    required this.id,
    required this.iduser,
    required this.prefix,
    required this.firstname,
    required this.lastname,
    required this.type,
    required this.user,
    required this.password,
  });
 
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'iduser': iduser,
      'prefix': prefix,
      'firstname': firstname,
      'lastname': lastname,
      'type': type,
      'user': user,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: (map['id'] ?? '') as String,
      iduser: (map['iduser'] ?? '') as String,
      prefix: (map['prefix'] ?? '') as String,
      firstname: (map['firstname'] ?? '') as String,
      lastname: (map['lastname'] ?? '') as String,
      type: (map['type'] ?? '') as String,
      user: (map['user'] ?? '') as String,
      password: (map['password'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
