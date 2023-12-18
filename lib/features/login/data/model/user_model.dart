import 'dart:convert';

import 'package:lookup/features/login/domain/entity/user_entity.dart';

class UserModel extends UserrEntity {
  const UserModel({super.name, super.email, super.uuid});

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'email': email, 'uuid': uuid};
  }

  String toJson() => json.encode(toMap());
}
