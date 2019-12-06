import 'package:first_flutter_app/pages/providerdemo/counter.dart';
import 'package:flutter/material.dart';
import './test_webview.dart';

// 测试数据在多级 父子组件中传递
class Page3Data extends StatefulWidget {
  @override
  _Page3DataState createState() => _Page3DataState();
}

class _Page3DataState extends State<Page3Data> {
  int _count = 0;
  void _increaseCount() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (_) => new WebViewExample()));
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
