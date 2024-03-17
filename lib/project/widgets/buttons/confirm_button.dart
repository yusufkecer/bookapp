import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmButton extends ConsumerWidget {
  final String text;
  final Function() onPressed;
  final double height;

  const ConfirmButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 60.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProviderBase theme = MyNotifiers.instance.theme;
    final themeStatus = ref.watch(theme);
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeStatus.darkModeEnabled
              ? Theme.of(context).buttonTheme.colorScheme?.background
              : Theme.of(context).primaryColor,
        ),
        onPressed: onPressed,
        child: Text(text,
            style: themeStatus.darkModeEnabled == false
                ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorData.kTextTitleColorDark,
                    )
                : Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
