import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile App Development - Assignment 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Increment & Toggle Button Actions',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _ctrVar = 0;

  final deadpoolImagePath = 'images/deadpool.jpg', wolverineImagePath = 'images/wolverine.jpg';

  bool isDeadpoolImage = true;

  late final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text(
              'Push the button to increment the count:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$_ctrVar',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              style: const ButtonStyle(
                foregroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(0, 76, 76, 173)),
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 75, 107, 194)),
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
              ),
              onPressed: () {
                _incrementCounter();
              },
              child: Text(
                'Increment',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Column(children: <Widget>[
                    Image.asset(
                      isDeadpoolImage ? deadpoolImagePath : wolverineImagePath,
                      fit: BoxFit.contain,
                      width: 300,
                    )
                  ]),
                ],
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                foregroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(0, 123, 211, 89)),
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 114, 224, 100)),
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
              ),
              onPressed: () {
                _toggleImage();
              },
              child: Text(
                'Toggle Image',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                foregroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(0, 76, 76, 173)),
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 235, 155, 155)),
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
              ),
              onPressed: () {
                _resetCtrAndImage();
              },
              child: Text(
                'Reset',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _incrementCounter() => setState(() {
        ++_ctrVar;
      });

  _toggleImage() => setState(() {
        isDeadpoolImage = !isDeadpoolImage;
      });

  _resetCtrAndImage() => setState(() {
        _ctrVar = 0;
        isDeadpoolImage = true;
      });

}
