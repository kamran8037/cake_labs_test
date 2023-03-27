import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../repo/app_repo.dart';
import '../../repo/prod_repo.dart';

final appRepoProvider = Provider<AppRepo>((_) => ProdRepo());
