import 'package:cake_labs_test/application/providers/auth_provider.dart';
import 'package:cake_labs_test/application/state_notifiers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/providers/pin_code_provider.dart';
import '../../application/state_notifiers/create_pin_notifier.dart';
import '../../common/consts.dart';
import '../../common/enums.dart';
import '../home_screen.dart';
import '../login_success_screen.dart';
import 'buttons.dart';

class NumPad extends HookConsumerWidget {
  final bool isAuthentication;

  const NumPad({super.key, this.isAuthentication = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CreatePinNotifier pinProvider = ref.watch(pinCodeProvider);
    AuthNotifier authProvider = ref.watch(authenticationProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(54, 0, 54, 54),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                Expanded(
                    child: NumPadButton(
                        num: "1",
                        onPressed: () {
                          onNumPressed(context, ref, '1');
                        })),
                const SizedBox(width: 44),
                Expanded(
                    child: NumPadButton(
                        num: "2",
                        onPressed: () {
                          onNumPressed(context, ref, '2');
                        })),
                const SizedBox(width: 44),
                Expanded(
                    child: NumPadButton(
                        num: "3",
                        onPressed: () {
                          onNumPressed(context, ref, '3');
                        })),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Flexible(
            child: Row(
              children: [
                Expanded(
                    child: NumPadButton(
                        num: "4",
                        onPressed: () {
                          onNumPressed(context, ref, '4');
                        })),
                const SizedBox(width: 44),
                Expanded(
                    child: NumPadButton(
                        num: "5",
                        onPressed: () {
                          onNumPressed(context, ref, '5');
                        })),
                const SizedBox(width: 44),
                Expanded(
                    child: NumPadButton(
                        num: "6",
                        onPressed: () {
                          onNumPressed(context, ref, '6');
                        })),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Flexible(
            child: Row(
              children: [
                Expanded(
                    child: NumPadButton(
                        num: "7",
                        onPressed: () {
                          onNumPressed(context, ref, '7');
                        })),
                const SizedBox(width: 44),
                Expanded(
                    child: NumPadButton(
                        num: "8",
                        onPressed: () {
                          onNumPressed(context, ref, '8');
                        })),
                const SizedBox(width: 44),
                Expanded(
                    child: NumPadButton(
                        num: "9",
                        onPressed: () {
                          onNumPressed(context, ref, '9');
                        })),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Flexible(
            child: Row(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                const SizedBox(width: 44),
                Expanded(
                    child: NumPadButton(
                        num: "0",
                        onPressed: () {
                          onNumPressed(context, ref, '0');
                        })),
                const SizedBox(width: 44),
                Expanded(
                    child: IconButton(
                  icon: const Icon(Icons.backspace),
                  onPressed: () {
                    if (isAuthentication) {
                      authProvider.erasePin();
                    } else {
                      pinProvider.erasePin();
                    }
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showAlertMessage(BuildContext context, WidgetRef ref) {
    CreatePinNotifier pinCode = ref.watch(pinCodeProvider);
    if (isAuthentication) {
      if (ref.read(authenticationProvider).authStatus == AuthStatus.failed) {
        showDialog(
            context: context,
            builder: (context) => Consumer(builder: (context, ref, _) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    title: const Text(Constants.authenticationFailed),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      TextButton(
                        onPressed: () {
                          pinCode.reset();
                          Navigator.of(context).pop();
                        },
                        child: const Text(Constants.retry),
                      )
                    ],
                  );
                }));
      }
    } else {
      if (pinCode.pinStatus == PINStatus.matched) {
        showDialog(
            context: context,
            builder: (context) => Consumer(builder: (context, ref, _) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    title: const Text(Constants.pinCreated),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      TextButton(
                        onPressed: () {
                          pinCode.reset();
                          Navigator.pushAndRemoveUntil(
                              context, HomeScreen.route(), (_) => false);
                        },
                        child: const Text(Constants.ok),
                      )
                    ],
                  );
                }));
      } else if (pinCode.pinStatus == PINStatus.notMatched) {
        showDialog(
            context: context,
            builder: (context) => Consumer(builder: (context, ref, _) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    title: const Text(Constants.pinNonCreated),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      TextButton(
                        onPressed: () {
                          pinCode.reset();
                          Navigator.of(context).pop();
                        },
                        child: const Text(Constants.ok),
                      )
                    ],
                  );
                }));
      }
    }
  }

  void onNumPressed(BuildContext context, WidgetRef ref, String pin) async {
    final authProvider = ref.watch(authenticationProvider);
    if (isAuthentication) {
      await authProvider.authentication(pin);
      if (authProvider.authStatus == AuthStatus.success) {
        Navigator.pushAndRemoveUntil(
            context, LoginSuccessScreen.route(), (_) => false);
        authProvider.reset();
      } else if (authProvider.authStatus == AuthStatus.failed) {
        showAlertMessage(context, ref);
        authProvider.reset();
      }
    } else {
      ref.watch(pinCodeProvider).createPin(pin);
      showAlertMessage(context, ref);
    }
  }
}
