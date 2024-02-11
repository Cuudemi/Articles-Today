import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: ChooseTopic(),
));

class WelcomeWindow extends StatelessWidget {
  const WelcomeWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ChooseTopic extends StatelessWidget {
  const ChooseTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Выберите темы, которые вас интересуют:'),

              Container(
                decoration: const BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: const EdgeInsets.all(20.0),
                child: const Row(
                  children: [
                    Text('Разработка',
                      style:
                        TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Text('Habr',
                      style:
                        TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.orange,
                child: const Row(
                  children: [
                    Text('Научпоп'),
                    Text('Habr'),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.blue,
                child: const Row(
                  children: [
                    Text('Дизайн'),
                    Text('Habr'),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.cyanAccent,
                child: const Row(
                  children: [
                    Text('Менеджмент'),
                    Text('Habr'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.tealAccent,
                child: const Row(
                  children: [
                    Text('Забота о себе'),
                    Text('Журнал «Кинжал»'),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
