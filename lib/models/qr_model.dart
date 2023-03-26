import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QrModel {
  final String id;
  final String qrcode;
  QrModel({
    required this.id,
    required this.qrcode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'qrcode': qrcode,
    };
  }

  factory QrModel.fromMap(Map<String, dynamic> map) {
    return QrModel(
      id: (map['id'] ?? '') as String,
      qrcode: (map['qrcode'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QrModel.fromJson(String source) => QrModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
