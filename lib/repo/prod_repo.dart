import 'package:cake_labs_test/repo/app_repo.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../common/consts.dart';

class ProdRepo extends AppRepo {
  ///
  ///
  Future<Box<String>> _pinBox() async {
    return Hive.isBoxOpen(Constants.pinBox)
        ? Hive.box(Constants.pinBox)
        : await Hive.openBox(Constants.pinBox);
  }

  ///
  ///
  @override
  Future<bool> pinAuth(String pin) async {
    Box<String> box = await _pinBox();
    debugPrint(
        'Entered PIN: $pin Whereas required Pin ${box.get(Constants.pinKey, defaultValue: Constants.pinKey)}');
    return box.get(Constants.pinKey, defaultValue: Constants.pinKey) == pin;
  }

  ///
  ///
  @override
  void savePin(String pin) async {
    Box<String> box = await _pinBox();
    box.put(Constants.pinKey, pin);
  }

  ///
  ///
  @override
  void close() async {
    if (Hive.isBoxOpen(Constants.pinBox)) {
      Box<String> box = Hive.box(Constants.pinBox);
      var v = await box.close();
      return v;
    }
  }
}
