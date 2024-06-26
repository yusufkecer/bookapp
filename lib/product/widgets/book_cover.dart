import 'package:bookapp/core/my_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookCover extends ConsumerWidget {
  final String url;
  final BoxFit boxFit;
  final double? height;

  const BookCover({super.key, required this.url, this.boxFit = BoxFit.fitWidth, this.height});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeNotifier = ref.watch(MyNotifiers.instance.theme);
    final assetPath = 'assets/images/book-cover-placeholder-${themeNotifier.darkModeEnabled ? 'dark' : 'light'}.png';

    return Container(
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: themeNotifier.darkModeEnabled ? Colors.black.withOpacity(0.40) : Colors.black.withOpacity(0.20),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: FadeInImage.assetNetwork(
          placeholder: assetPath,
          image: url.isEmpty ? assetPath : url,
          fit: boxFit,
          alignment: Alignment.topCenter,
          fadeInDuration: const Duration(milliseconds: 350),
        ),
      ),
    );
  }
}
