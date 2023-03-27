import 'package:cake_labs_test/repo/app_repo.dart';
import 'package:flutter/material.dart';

import '../../common/enums.dart';

class CreatePinNotifier extends ChangeNotifier {
  final AppRepo repoProvider;

  CreatePinNotifier(this.repoProvider);

  PINStatus pinStatus = PINStatus.firstPIN;
  String firstPIN = "";
  String secondPIN = "";

  void createPin(String pin) {
    if (firstPIN.length < 4) {
      firstPIN = '$firstPIN$pin';
      if (firstPIN.length == 4) {
        pinStatus = PINStatus.secondPIN;
      }
    } else {
      secondPIN = '$secondPIN$pin';
      if (secondPIN.length == 4) {
        if (firstPIN == secondPIN) {
          pinStatus = PINStatus.matched;
          repoProvider.savePin(secondPIN);
        } else {
          pinStatus = PINStatus.notMatched;
        }
      }
    }
    notifyListeners();
  }

  void erasePin() {
    if (firstPIN.length < 4) {
      firstPIN = firstPIN.substring(0, firstPIN.length - 1);
    } else {
      secondPIN = secondPIN.substring(0, secondPIN.length - 1);
    }
    notifyListeners();
  }

  void reset() {
    pinStatus = PINStatus.firstPIN;
    firstPIN = '';
    secondPIN = '';
    notifyListeners();
  }

  int getPinCounts() {
    if (firstPIN.length < 4) {
      return firstPIN.length;
    } else {
      return secondPIN.length;
    }
  }
}
