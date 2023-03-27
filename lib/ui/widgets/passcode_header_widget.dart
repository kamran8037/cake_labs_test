import 'package:cake_labs_test/application/providers/auth_provider.dart';
import 'package:cake_labs_test/application/state_notifiers/create_pin_notifier.dart';
import 'package:cake_labs_test/ui/widgets/pin_sphere.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/providers/pin_code_provider.dart';
import '../../common/consts.dart';
import '../../common/enums.dart';

class PassCodeHeader extends HookConsumerWidget {
  final bool isAuthentication;

  const PassCodeHeader({super.key, this.isAuthentication = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinProvider = ref.watch(pinCodeProvider);
    final authProvider = ref.watch(authenticationProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: Text(title(pinProvider),
              style: const TextStyle(color: Color(0xFF687ea1), fontSize: 24)),
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => PinCodeIndicator(
                filled: isAuthentication
                    ? index < authProvider.getPinCounts()
                    : index < pinProvider.getPinCounts(),
              ),
            ),
          ),
        )
      ],
    );
  }

  String title(CreatePinNotifier pinNotifier) {
    if (isAuthentication) {
      return Constants.authentication;
    } else if (pinNotifier.pinStatus == PINStatus.firstPIN) {
      return Constants.createPIN;
    } else if (pinNotifier.pinStatus == PINStatus.secondPIN ||
        pinNotifier.pinStatus == PINStatus.matched ||
        pinNotifier.pinStatus == PINStatus.notMatched) {
      return Constants.reEnterYourPIN;
    }
    return '';
  }
}
