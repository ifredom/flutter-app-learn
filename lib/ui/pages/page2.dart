import 'package:first_flutter_app/ui/pages/provider2_demo.dart';
import 'package:first_flutter_app/ui/pages/provider_demo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build Page2页面");
    return Provider(
      create: (_) => Provider2DemoModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("页面二"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text("点击"),
                onPressed: () {
                  final store = Provider.of<Provider2DemoModel>(context, listen: true);
                  print(store);
                  store.setTitle("新标题");
                },
              ),
              Consumer(
                builder: (context, Provider2DemoModel snapshot, child) {
                  print("_build page2 内部方法2");
                  print(snapshot);
                  return Text(snapshot.title);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
