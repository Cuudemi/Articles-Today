import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodayArticlePage extends StatelessWidget {
  const TodayArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Открываем коробку и извлекаем значение
    var themesBox = Hive.box('themesBox');
    var storedValue = themesBox.get('selectedThemes', defaultValue: 'Нет значения');

    // Отображение уведомления
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Значение в коробке: $storedValue'),
          duration: const Duration(seconds: 3),
        ),
      );
    });

    themesBox.close();

    return Scaffold(
    );
  }
}