import 'package:cake_labs_test/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../common/consts.dart';
import 'authentication_screen.dart';
import 'create_pin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              title: Constants.createPIN,
              onPressed: () {
                Navigator.push(context, CreatePINScreen.route());
              },
            ),
            PrimaryButton(
              title: Constants.authentication,
              onPressed: () {
                Navigator.push(context, AuthenticationScreen.route());
              },
            ),
          ],
        ),
      ),
    );
  }
}
