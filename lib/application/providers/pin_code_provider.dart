import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state_notifiers/create_pin_notifier.dart';
import 'app_repo_provider.dart';

final pinCodeProvider = ChangeNotifierProvider<CreatePinNotifier>((ref) {
  return CreatePinNotifier(ref.read(appRepoProvider));
});
