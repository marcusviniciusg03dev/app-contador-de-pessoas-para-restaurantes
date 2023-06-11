import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  bool get isFull => counter == 20;

  bool get isEmpty => counter == 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/restaurant.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isFull ? 'Lotado!' : 'Pode entrar!',
                style: TextStyle(
                    fontSize: 30,
                    color: isFull ? Colors.red : Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  '$counter',
                  style: const TextStyle(
                      fontSize: 100,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              Colors.white.withOpacity(isEmpty ? 0.2 : 1),
                          fixedSize: const Size(100, 100),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))),
                      onPressed: isEmpty ? null : decrement,
                      child: const Text('Saiu',
                          style: TextStyle(color: Colors.black, fontSize: 16))),
                  const SizedBox(width: 32),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              Colors.white.withOpacity(isFull ? 0.2 : 1),
                          fixedSize: const Size(100, 100),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))),
                      onPressed: isFull ? null : increment,
                      child: const Text('Entrou',
                          style: TextStyle(color: Colors.black, fontSize: 16))),
                ],
              )
            ],
          ),
        ));
  }
}
