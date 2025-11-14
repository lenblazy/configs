import 'package:flutter/material.dart';
import 'package:ui_flutter/ui.dart';

class GoldenTestWrapper extends StatelessWidget {
  const GoldenTestWrapper({
    super.key,
    required this.getChild,
    this.brightness = Brightness.light,
  });

  final Widget Function(BuildContext) getChild;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    final isDark = brightness == Brightness.dark;

    return Theme(
      data: ThemeData(
        brightness: brightness,
        extensions: [
          AppTheme(
            dimensTheme: AppDimensTheme.main(),
            textTheme: isDark ? AppTextTheme.dark() : AppTextTheme.light(),
            colorTheme: isDark ? AppColorTheme.dark() : AppColorTheme.light(),
            buttonTheme: isDark
                ? AppButtonTheme.dark()
                : AppButtonTheme.light(),
            inputFieldTheme: isDark
                ? InputFieldTheme.dark()
                : InputFieldTheme.light(),
          ),
        ],
      ),
      child: Builder(builder: (context) => getChild(context)),
    );
  }
}

class DesignSystemHelper {
  static Widget getColors() {
    return GoldenTestWrapper(
      getChild: (context) {
        final colors = context.appColorTheme;
        final swatches = [
          colors.primary,
          colors.secondary,
          colors.background,
          colors.surface,
          colors.error,
          colors.success,
        ];
        return Wrap(
          children: swatches.map((color) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Container(width: 48, height: 48, color: color),
            );
          }).toList(),
        );
      },
    );
  }

  static Widget getTexts() {
    return GoldenTestWrapper(
      getChild: (context) {
        final texts = context.appTextTheme;
        final styles = [
          texts.labelTitleBold,
          texts.labelTitleNormal,
          texts.labelSubtitleBold,
          texts.labelBodyBold,
          texts.labelBodyNormal,
          texts.labelButtonNormal,
          texts.labelButtonSmall,
        ];
        return Wrap(
          children: styles.map((style) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Text("Sample Text", style: style),
            );
          }).toList(),
        );
      },
    );
  }

  static Widget getButtons() {
    return GoldenTestWrapper(
      getChild: (context) {
        return Wrap(
          children:
              [
                AppButton.primary(
                  label: "Primary Enabled",
                  onTap: () {},
                  context: context,
                ),
                AppButton.primary(
                  label: "Primary Disabled",
                  onTap: () {},
                  isEnabled: false,
                  context: context,
                ),
              ].map((button) {
                return Padding(padding: const EdgeInsets.all(4), child: button);
              }).toList(),
        );
      },
    );
  }

  static Widget getInputField() {
    return GoldenTestWrapper(
      getChild: (context) {
        return SizedBox(
          width: 150,
          height: 50,
          child: AppInputField.text(label: "Active Input"),
        );
      },
    );
  }

  static Widget getSecondaryButtons() {
    return GoldenTestWrapper(
      getChild: (context) {
        return Wrap(
          children:
              [
                AppButton.secondary(
                  label: "Secondary Enabled",
                  onTap: () {},
                  context: context,
                ),
                AppButton.secondary(
                  label: "Secondary Disabled",
                  onTap: () {},
                  isEnabled: false,
                  context: context,
                ),
              ].map((button) {
                return Padding(padding: const EdgeInsets.all(4), child: button);
              }).toList(),
        );
      },
    );
  }
}
