import 'package:cake_labs_test/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common/appearance/appearance_provider.dart';
import 'common/appearance/light_appearance.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppearanceProvider(
      appearance: LightAppearance(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
