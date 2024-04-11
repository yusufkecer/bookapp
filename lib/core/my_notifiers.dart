import 'package:bookapp/product/util/notifiers/book_notifier.dart';
import 'package:bookapp/product/util/notifiers/nav_notifiers.dart';
import 'package:bookapp/product/util/notifiers/theme_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNotifiers extends ImpNotifiers {
  MyNotifiers._();

  static final MyNotifiers instance = MyNotifiers._();

  factory MyNotifiers() => instance;

  @override
  final theme = ChangeNotifierProvider<ThemeNotifier>((ref) => ThemeNotifier());
  @override
  final books = ChangeNotifierProvider<BookNotifier>((ref) => BookNotifier());
  @override
  final nav = ChangeNotifierProvider<NavNotifiers>((ref) => NavNotifiers());
}

abstract class ImpNotifiers {
  ProviderBase<ThemeNotifier> get theme;
  ProviderBase<BookNotifier> get books;
  ProviderBase<NavNotifiers> get nav;
}
