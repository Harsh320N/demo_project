// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

List<UserListModel> userListModelFromJson(String str) => List<UserListModel>.from(json.decode(str).map((x) => UserListModel.fromJson(x)));

String userListModelToJson(List<UserListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserListModel {
  UserListModel({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.gender = '',
    this.status = '',
  });

  int id;
  String name;
  String email;
  String gender;
  String status;

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
    id: json["id"] ?? 0,
    name: json["name"] ?? '',
    email: json["email"] ?? '',
    gender: json["gender"] ?? '',
    status: json["status"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "gender": gender,
    "status": status,
  };
}
