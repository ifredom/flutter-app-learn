import 'package:flutter/material.dart';

import './counter.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CounterProvider(
        count: _count,
        increaseCount: _increaseCount,
        child: ChildTestWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount,
      ),
    );
  }
}

class ChildTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChildTestWidget2();
  }
}

class ChildTestWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int _count = CounterProvider.of(context).count;
    final VoidCallback _increaseCount =
        CounterProvider.of(context).increaseCount;
    return ActionChip(
      label: Text("$_count"),
      onPressed: _increaseCount,
    );
  }
}
