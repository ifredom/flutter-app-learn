import 'package:first_flutter_app/ui/pages/provider2_demo.dart';
import 'package:first_flutter_app/ui/pages/provider_demo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build Page2页面");
    return Scaffold(
      appBar: AppBar(
        title: Text("页面二"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("点击"),
              onPressed: () {
                final store =
                    Provider.of<ProviderDemoModel>(context, listen: false);
                store.add();
              },
            ),
            Consumer(
              builder: (context, ProviderDemoModel snapshot, child) {
                print("_build page2 内部方法1");
                return Text(snapshot.price.toString());
              },
            ),
            Consumer(
              builder: (context, Provider2DemoModel snapshot, child) {
                print("_build page2 内部方法2");
                return Text(snapshot.title);
              },
            ),
          ],
        ),
      ),
    );
  }
}