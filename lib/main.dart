import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(
          child: Text('Hello World!'),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 29, 31, 36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: Column(children: [
                  Image.asset('assets/icons/bottom-nav/home.png',
                      width: 24.0, height: 24.0),
                  const Text('Home'),
                ]),
              ),
              TextButton(
                onPressed: () {},
                child: Column(children: [
                  Image.asset('assets/icons/bottom-nav/group-events.png',
                      width: 24.0, height: 24.0),
                  const Text('Mates'),
                ]),
              ),
              TextButton(
                onPressed: () {},
                child: Column(children: [
                  Image.asset('assets/icons/bottom-nav/chat.png',
                      width: 24.0, height: 24.0),
                  const Text('Chat'),
                ]),
              ),
              TextButton(
                onPressed: () {},
                child: Column(children: [
                  Image.asset('assets/icons/bottom-nav/user-profile.png',
                      width: 24.0, height: 24.0),
                  const Text('Profile'),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
