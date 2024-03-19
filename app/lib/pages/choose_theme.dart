import 'dart:math';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class ChooseThemePage extends StatefulWidget {
  const ChooseThemePage({super.key});

  @override
  State<ChooseThemePage> createState() => _ChooseThemePageState();
}

class _ChooseThemePageState extends State<ChooseThemePage> {
  Color increaseColorLightness(Color color, double increment) {
    var hslColor = HSLColor.fromColor(color);
    var newValue = min(max(hslColor.lightness + increment, 0.0), 1.0);
    return hslColor.withLightness(newValue).toColor();
  }

  Color _yellowCurrentColor = const Color(0xFFFFB703);
  final Color _yellowNoTouchColor = const Color(0xFFFFB703);
  late Color _yellowTouchColor;

  Color _orangeCurrentColor = const Color(0xFFFB8500);
  final Color _orangeNoTouchColor = const Color(0xFFFB8500);
  late Color _orangeTouchColor;

  Color _blueCurrentColor = const Color(0xFF219EBC);
  final Color _blueNoTouchColor = const Color(0xFF219EBC);
  late Color _blueTouchColor;

  Color _skyCurrentColor = const Color(0xFF8ECAE6);
  final Color _skyNoTouchColor = const Color(0xFF8ECAE6);
  late Color _skyTouchColor;

  Color _greenCurrentColor = const Color(0xFF3ED9B1);
  final Color _greenNoTouchColor = const Color(0xFF3ED9B1);
  late Color _greenTouchColor;

  @override
  void initState() {
    super.initState();
    _yellowTouchColor = increaseColorLightness(_yellowNoTouchColor, 0.2);
    _orangeTouchColor = increaseColorLightness(_orangeNoTouchColor, 0.2);
    _blueTouchColor = increaseColorLightness(_blueNoTouchColor, 0.2);
    _skyTouchColor = increaseColorLightness(_skyNoTouchColor, 0.2);
    _greenTouchColor = increaseColorLightness(_greenCurrentColor, 0.2);
  }

  Widget buildTopicButton(
    Color currentColor,
    Color noTouchColor,
    Color touchColor,
    String buttonText,
    String subButtonText,
    void Function() onPressed,
  ) {
    return OutlinedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: currentColor,
          padding: const EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          side: const BorderSide(width: 5.0, color: Color(0x00023047))),
      child: Row(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(buttonText,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              )),
          const Text('  '),
          Text(subButtonText,
              style: const TextStyle(
                fontSize: 15,
                height: 1.7,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Выберите темы, которые вас интересуют:',
                  style: TextStyle(
                    color: Color(0xFF023047),
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  )),
              buildTopicButton(
                _yellowCurrentColor,
                _yellowNoTouchColor,
                _yellowTouchColor,
                'Разработка',
                'Habr',
                () {
                  setState(() {
                    if (_yellowCurrentColor == _yellowNoTouchColor) {
                      _yellowCurrentColor = _yellowTouchColor;
                    } else if (_yellowCurrentColor == _yellowTouchColor) {
                      _yellowCurrentColor = _yellowNoTouchColor;
                    }
                  });
                },
              ),
              buildTopicButton(
                _orangeCurrentColor,
                _orangeNoTouchColor,
                _orangeTouchColor,
                'Научпоп',
                'Habr',
                () {
                  setState(() {
                    if (_orangeCurrentColor == _orangeNoTouchColor) {
                      _orangeCurrentColor = _orangeTouchColor;
                    } else if (_orangeCurrentColor == _orangeTouchColor) {
                      _orangeCurrentColor = _orangeNoTouchColor;
                    }
                  });
                },
              ),
              buildTopicButton(
                _blueCurrentColor,
                _blueNoTouchColor,
                _blueTouchColor,
                'Дизайн',
                'Habr',
                () {
                  setState(() {
                    if (_blueCurrentColor == _blueNoTouchColor) {
                      _blueCurrentColor = _blueTouchColor;
                    } else if (_blueCurrentColor == _blueTouchColor) {
                      _blueCurrentColor = _blueNoTouchColor;
                    }
                  });
                },
              ),
              buildTopicButton(
                _skyCurrentColor,
                _skyNoTouchColor,
                _skyTouchColor,
                'Менеджмент',
                'Habr',
                () {
                  setState(() {
                    if (_skyCurrentColor == _skyNoTouchColor) {
                      _skyCurrentColor = _skyTouchColor;
                    } else if (_skyCurrentColor == _skyTouchColor) {
                      _skyCurrentColor = _skyNoTouchColor;
                    }
                  });
                },
              ),
              buildTopicButton(
                _greenCurrentColor,
                _greenNoTouchColor,
                _greenTouchColor,
                'Забота о себе',
                'Habr',
                () {
                  setState(() {
                    if (_greenCurrentColor == _greenNoTouchColor) {
                      _greenCurrentColor = _greenTouchColor;
                    } else if (_greenCurrentColor == _greenTouchColor) {
                      _greenCurrentColor = _greenNoTouchColor;
                    }
                  });
                },
              ),
              OutlinedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/todayArticle');
                    // Navigator.pushNamedAndRemoveUntil(context, '/todayArticle', (route) => false);
                    var box = Hive.box('myBox');

                    var name = box.get('key');

                    Navigator.pushReplacementNamed(context, '/todayArticle');
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF023047),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      side: const BorderSide(width: 3.0, color: Colors.black)),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text("Подтвердить темы и продолжить",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ))
            ],
          ),
        )));
  }
}
