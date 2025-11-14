import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'golden_test_wrapper.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await loadAppFonts();

  testGoldens("Design system - Light themes", (tester) async {
    final builder = GoldenBuilder.column()
      ..addScenario("Colors", DesignSystemHelper.getColors())
      ..addScenario("Texts", DesignSystemHelper.getTexts())
      ..addScenario("Primary Btn", DesignSystemHelper.getButtons())
      ..addScenario("Secondary Btn", DesignSystemHelper.getSecondaryButtons());

    // Light theme
    await tester.pumpWidgetBuilder(
      GoldenTestWrapper(
        brightness: Brightness.light,
        getChild: (_) => builder.build(),
      ),
    );
    await screenMatchesGolden(tester, "design_system_light");
  });

  testGoldens("Design system - Dark theme", (tester) async {
    final builder = GoldenBuilder.column(bgColor: Colors.black)
      ..addScenario("Colors", DesignSystemHelper.getColors())
      ..addScenario("Texts", DesignSystemHelper.getTexts())
      ..addScenario("Input Field", DesignSystemHelper.getInputField())
      ..addScenario("Primary Btn", DesignSystemHelper.getButtons())
      ..addScenario("Secondary Btn", DesignSystemHelper.getSecondaryButtons());

    await tester.pumpWidgetBuilder(
      GoldenTestWrapper(
        brightness: Brightness.dark,
        getChild: (_) => builder.build(),
      ),
      wrapper: materialAppWrapper(
        theme: ThemeData(brightness: Brightness.dark),
      ),
    );
    await screenMatchesGolden(tester, "design_system_dark");
  });
}

Future<void> loadAppFonts() async {
  final fontLoader = FontLoader('Roboto');
  fontLoader.addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Roboto-Bold.ttf'));
  fontLoader.addFont(rootBundle.load('assets/fonts/Roboto-Medium.ttf'));
  await fontLoader.load();
}
