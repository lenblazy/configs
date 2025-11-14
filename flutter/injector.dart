import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:app_name/di/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(includeMicroPackages: true, externalPackageModulesBefore: [
  ],
)
Future<GetIt> configureDependencies() async => await getIt.init();
