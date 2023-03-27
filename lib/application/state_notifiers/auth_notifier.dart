import 'package:cake_labs_test/repo/app_repo.dart';
import 'package:flutter/material.dart';

import '../../common/enums.dart';

class AuthNotifier extends ChangeNotifier {
  final AppRepo repoProvider;
  AuthStatus authStatus = AuthStatus.required;
  String pinRequired = "";

  AuthNotifier(this.repoProvider);

  Future<void> authentication(String pin) async {
    if (pinRequired.length < 4) {
      pinRequired = '$pinRequired$pin';
      if (pinRequired.length == 4) {
        await repoProvider.pinAuth(pinRequired).then((value) {
          if (value) {
            authStatus = AuthStatus.success;
          } else {
            authStatus = AuthStatus.failed;
          }
          notifyListeners();
        });
      }
    }
    notifyListeners();
  }

  void erasePin() {
    if (pinRequired.isNotEmpty) {
      pinRequired = pinRequired.substring(0, pinRequired.length - 1);
      notifyListeners();
    }
  }

  void reset() {
    authStatus = AuthStatus.required;
    pinRequired = '';
    notifyListeners();
  }

  int getPinCounts() {
    return pinRequired.length;
  }
}
