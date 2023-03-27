import 'package:cake_labs_test/ui/widgets/numpad_widget.dart';
import 'package:cake_labs_test/ui/widgets/passcode_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/providers/auth_provider.dart';
import '../application/providers/pin_code_provider.dart';
import '../common/appearance/appearance_provider.dart';
import '../common/consts.dart';

class AuthenticationScreen extends HookConsumerWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const AuthenticationScreen());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appearance = AppearanceProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            ref.read(authenticationProvider).reset();
            ref.read(pinCodeProvider).reset();
            Navigator.pop(context);
          },
        ),
        actions: [
          Center(
              child: Text(Constants.sixDigitsPin,
                  style: appearance.subTitleTextStyle))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            Expanded(
                flex: 2,
                child: PassCodeHeader(
                  isAuthentication: true,
                )),
            Expanded(
                flex: 3,
                child: NumPad(
                  isAuthentication: true,
                )),
          ],
        ),
      ),
    );
  }
}
