import 'package:flutter/material.dart';
import 'package:mvvm/data/response/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final _myRapo = AuthReporsity();
  Future<void> loginApi(dynamic data) async {
    _myRapo
        .loginApi(data)
        .then((value) => {})
        .onError((error, stackTrace) => {});
  }
}
