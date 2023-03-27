import 'package:cake_labs_test/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../common/appearance/appearance_provider.dart';
import '../common/consts.dart';
import 'home_screen.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginSuccessScreen());
  }

  @override
  Widget build(BuildContext context) {
    final appearance = AppearanceProvider.of(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 54),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                Constants.authenticationSuccess,
                style: appearance.heading6TextStyle,
              ))),
              PrimaryButton(
                  title: 'Back',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context, HomeScreen.route(), (_) => false);
                  })
            ],
          ),
        ),
      )),
    );
  }
}
