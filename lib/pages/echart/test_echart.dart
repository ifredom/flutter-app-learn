import 'package:flutter/material.dart';
import 'package:my_echarts/my_echarts.dart';

final Map<String, dynamic> lineOption = {
  "title": {"text": "Echarts line example"},
  "xAxis": {
    "type": 'category',
    "data": ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  },
  "yAxis": {"type": 'value'},
  "series": [
    {
      "data": [820, 932, 901, 934, 1290, 1330, 1320],
      "type": 'line',
      "smooth": true
    }
  ]
};

final Map<String, dynamic> barOption = {
  "title": {"text": "Echarts entry example"},
  "tooltip": {},
  "lengend": {
    "data": ["Sales"]
  },
  "xAxis": {
    "data": ["shirt", "cardign", "chiffon shirt", "pants", "heels", "socks"]
  },
  "yAxis": {},
  "series": [
    {
      "name": "Sales",
      "data": [5, 20, 36, 10, 10, 20],
      "type": "bar"
    }
  ]
};

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  Map<String, dynamic> _option = {};
  EChartsWebController webController;

  @override
  void initState() {
    super.initState();
    webController =
        EChartsWebController(htmlLocation: "assets/echarts/index.html");

    setState(() {
      _option = barOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Echarts Plugin Example'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: ECharts(webController, data: _option),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text('Update'),
                      onPressed: () {
                        _update();
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              )
            ],
          )),
    );
  }

  _update() {
    if (_option == lineOption) {
      _option = barOption;
    } else if (_option == barOption) {
      _option = lineOption;
    }
    this.webController.initECharts(_option);
  }
}
