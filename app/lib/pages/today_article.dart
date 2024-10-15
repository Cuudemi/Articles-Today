import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';

class TodayArticlePage extends StatefulWidget {
  const TodayArticlePage({super.key});

  @override
  State<TodayArticlePage> createState() => _TodayArticlePageState();
}

class _TodayArticlePageState extends State<TodayArticlePage> {
  final dio = Dio();
  Response? response;
  late Box themesBox;

  @override
  void initState() {
    super.initState();
    getHttp();
    openBox();
  }

  Future<void> openBox() async {
    themesBox = await Hive.openBox('themesBox');
    setState(() {}); // Обновляем интерфейс, когда бокс открыт
  }

  // Асинхронный запрос с использованием Dio
  Future<void> getHttp() async {
    try {
      Response res = await dio.get('http://192.168.0.172:8000/source');
      setState(() {
        response = res; // Обновляем состояние после получения данных
      });
    } catch (e) {
      print('Ошибка запроса: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var storedValue = themesBox.get('selectedThemes', defaultValue: 'Нет значения');

    return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Значение в коробке: $storedValue', textAlign: TextAlign.center),
          if (response == null)
            const CircularProgressIndicator()
          else
            Text('Ответ с сайта: ${response?.data.toString()}', textAlign: TextAlign.center),
        ],
        )
      ),
    );
  }
}