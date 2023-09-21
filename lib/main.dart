import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_notifier.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CounterNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Counter App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Counter Application")),
        body: Consumer<CounterNotifier>(builder: (context, counter, child) {
          return Center(
            child: Text("Your counter is ${counter.count}"),
          );
        }),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () =>
                  Provider.of<CounterNotifier>(context, listen: false)
                      .increment(),
              tooltip: "Increment",
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () =>
                  Provider.of<CounterNotifier>(context, listen: false)
                      .decrement(),
              tooltip: "Decrement",
              child: const Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
