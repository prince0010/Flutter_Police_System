import 'package:flutter/material.dart';

class ErrorMsg {
  bool success;
  String message;
  ErrorMsg({required this.success, required this.message});
  factory ErrorMsg.fromJson(Map<String, dynamic> json) => ErrorMsg(
        success: json['success'],
        message: json['message'],
      );
  Map<String, dynamic> toJson() => {"success": success, "message": message};
}
