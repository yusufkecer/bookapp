import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/product/util/notifiers/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProviderBase<ThemeNotifier> theme = MyNotifiers.instance.theme;
    ThemeNotifier data = ref.watch(theme);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            ListTile(
                leading: const Icon(Icons.color_lens),
                title: Text(data.darkModeEnabled == true ? 'Koyu Tema' : 'Açık Tema'),
                trailing: Switch(
                  value: data.darkModeEnabled,
                  onChanged: (value) {
                    data.toggleTheme();
                  },
                )),
            ListTile(),
          ],
        ),
      ),
    );
  }
}
