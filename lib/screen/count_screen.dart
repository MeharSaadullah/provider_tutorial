import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    countProvider.setcount();
    Timer.periodic(Duration(seconds: 2), (timer) {});
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      //   backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('provider')),
      ),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Text(
            value.count.toString(),
            style: TextStyle(fontSize: 20),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setcount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
