import 'package:flutter/material.dart';

// counter计数器。
// 理解state生命周期

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;
  List dataList;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print(_counter);
    print(mounted); // 生命周期内包含
    _fetchData();
  }

  Future<Null> _fetchData() async {
    await Future.delayed(Duration(seconds: 5), () {
      print('_fetchData');
      setState(() {
        dataList = List.generate(40, (i) => i);
        return null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlatButton(
        child: Text('$_counter'),
        onPressed: () => setState(() => ++_counter),
      )),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() { // 失效
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {// 丢掉, 处理, 安置
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {// 重组
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}
