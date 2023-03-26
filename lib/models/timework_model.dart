import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TimeWorkModel {
  final String id;
  final String checkInTime;
  final String checkOutTime;
  final String iduser;
  TimeWorkModel({
    required this.id,
    required this.checkInTime,
    required this.checkOutTime,
    required this.iduser,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'iduser': iduser,
    };
  }

  factory TimeWorkModel.fromMap(Map<String, dynamic> map) {
    return TimeWorkModel(
      id: (map['id'] ?? '') as String,
      checkInTime: (map['checkInTime'] ?? '') as String,
      checkOutTime: (map['checkOutTime'] ?? '') as String,
      iduser: (map['iduser'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TimeWorkModel.fromJson(String source) => TimeWorkModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
