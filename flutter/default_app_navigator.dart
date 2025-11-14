import 'package:auto_route/auto_route.dart';
import 'package:core_flutter/core.dart';

class DefaultAppNavigator implements AppNavigator {
  const DefaultAppNavigator(this._router);

  final StackRouter _router;
}
