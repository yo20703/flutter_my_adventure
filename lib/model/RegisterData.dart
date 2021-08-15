//註冊時用的Json資料
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegisterData {
  String status = "";
  String account = "";
  String password = "";
  String nickname = "";

  RegisterData(this.status, this.account, this.password, this.nickname);

  RegisterData.onlyStatus(this.status);

  String json() {
    return jsonEncode({
      "status": status,
      "account": account,
      "password": password,
      "nickname": nickname
    });
  }
}
