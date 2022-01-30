import 'package:flutter/foundation.dart';

class StudentData {
  int id;
  String email;
  String name;
  String photo;
  String phone;
  String address;
  String studyLevel;
  DateTime createdAt;
  DateTime emailVerifiedAt;

  StudentData({
    required this.id,
    required this.email,
    required this.name,
    required this.photo,
    required this.phone,
    required this.address,
    required this.studyLevel,
    required this.createdAt,
    required this.emailVerifiedAt,
  });
}
