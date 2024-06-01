import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    // final ExampleOneProvider = Provider.of<ExampleOneProvider>(context);
    // final Provider = Provider.of<ExampleOneProvider>(context);
    final exampleOneProvider = Provider.of<ExampleOneProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Example one')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
              min: 0,
              max: 1,
              value: value,
              onChanged: (val) {
                print(value);
                value = val;

                setState(() {});
              }),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration:
                      BoxDecoration(color: Colors.green.withOpacity(value)),
                  child: Text('Container 1'),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration:
                      BoxDecoration(color: Colors.red.withOpacity(value)),
                  child: Text('Container 2'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
