import 'package:flutter/material.dart';
import 'package:app/pages/choose_theme.dart';
import 'package:app/pages/today_article.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');

  box.put('key', 'value');

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const ChooseThemePage(),
      '/todayArticle': (context) => const TodayArticlePage()
    },
  ));
}