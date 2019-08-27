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

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          onPressed: ()=>setState(()=> ++_counter),
        )
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget){
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
    print(_counter);
  }

  @override
  void deactivate(){
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose(){
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble(){
    super.reassemble();
    print('reassemble');
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }



}
