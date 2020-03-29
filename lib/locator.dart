import 'package:first_flutter_app/pages/provider_demo.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

// 解释 https://github.com/awesome-tips/Flutter-Tips/blob/7215ac5bc4888aca46f9e146f711479d975c9fe3/articles/Flutter%20%20%E9%80%9A%E8%BF%87%20ServiceLocator%20%E5%AE%9E%E7%8E%B0%E6%97%A0%20context%20%E5%AF%BC%E8%88%AA.md
Future<void> setupLocator({bool test = false}) async {
  // Singleton of the viewmodel
  locator.registerLazySingleton<ProviderDemoModel>(() => ProviderDemoModel());

  // Data sources

  // Repositories

  if (!test) {
    await _setupSharedPreferences();
  }
}

Future<void> _setupSharedPreferences() async {}
