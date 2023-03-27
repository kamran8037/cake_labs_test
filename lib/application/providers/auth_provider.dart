import 'package:cake_labs_test/application/providers/app_repo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state_notifiers/auth_notifier.dart';

final authenticationProvider = ChangeNotifierProvider<AuthNotifier>((ref) {
  return AuthNotifier(ref.read(appRepoProvider));
});
