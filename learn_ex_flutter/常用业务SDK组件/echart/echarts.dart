import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'echarts_web_controller.dart';
import 'platform_native_web.dart';

class ECharts extends StatefulWidget {
  ECharts(this.webController, {this.data, this.child, this.height});

  final Widget child;

  final Map data;
  final double height;
  final EChartsWebController webController;

  @override
  _EChartsState createState() => _EChartsState();
}

class _EChartsState extends State<ECharts> {
  EChartsWebController webController;

  bool finished = false;

  Future onWebCreated(int id) async {
    print("webCreated");
    this.webController = widget.webController;
    this.webController.init(id);

    this.webController.onPageFinished.listen((url) {
      print("Finished loading $url");
      this.webController.initECharts(widget.data); //.evalJs(data);
      setState(() {
        finished = true;
      });
    });
    var data = await rootBundle.loadString(
        this.webController.htmlLocation ?? "assets/echarts/index.html",
        cache: false);
    this.webController.loadData(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finished = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: Colors.white,
      child: Stack(overflow: Overflow.clip, children: <Widget>[
        widget.child ?? const Center(child: const CircularProgressIndicator()),
        AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: finished ? 1.0 : 0.0,
            child: PlatformNativeWeb(onWebCreated: onWebCreated))
      ]),
    );
  }
}
