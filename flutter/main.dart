import 'package:package_name/router/app_router.dart';
import 'package:package_name/router/default_app_navigator.dart';
import 'package:core_flutter/core.dart';
import 'package:flutter/material.dart';
import 'package:ui_flutter/ui.dart';

import 'di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appRouter = AppRouter();
  await configureDependencies();
  getIt.registerLazySingleton<AppNavigator>(
    () => DefaultAppNavigator(appRouter),
  );
  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'app_name',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          AppTheme(
            dimensTheme: AppDimensTheme.main(),
            textTheme: AppTextTheme.light(),
            colorTheme: AppColorTheme.light(),
            buttonTheme: AppButtonTheme.light(),
            inputFieldTheme: InputFieldTheme.light(),
          ),
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          AppTheme(
            dimensTheme: AppDimensTheme.main(),
            textTheme: AppTextTheme.dark(),
            colorTheme: AppColorTheme.dark(),
            buttonTheme: AppButtonTheme.dark(),
            inputFieldTheme: InputFieldTheme.dark(),
          ),
        ],
      ),
    );
  }
}
