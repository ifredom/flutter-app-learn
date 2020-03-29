import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_flutter_app/pages/provider_demo.dart';
import 'package:first_flutter_app/pages/provider2_demo.dart';
import 'page2.dart';

class Page1Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build Page1页面");
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("点击"),
              onPressed: () {
                final store =
                    Provider.of<ProviderDemoModel>(context, listen: false);
                store.add();
                final store2 =
                    Provider.of<Provider2DemoModel>(context, listen: false);
                store2.setTitle();

                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (_) => Page2Demo(),
                  ),
                );
              },
            ),
            Consumer(
              builder: (context, ProviderDemoModel snapshot, child) {
                print("_build page1 内部方法");
                return Text(snapshot.price.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
