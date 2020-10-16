import 'package:first_flutter_app/ui/pages/provider_demo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page2.dart';

class Page1Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ProviderDemoModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("页面一"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("跳转到page2"),
                onPressed: () {
                  print(store.price);
                  // store.add();
                  // final store2 = Provider.of<Provider2DemoModel>(
                  //   context,
                  // );
                  // store2.setTitle();
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => Page2Demo()));
                },
              ),
              Text(store.price.toString()),
              // Consumer<ProviderDemoModel>(
              //   builder: (context, snapshot, child) {
              //     print("_build page1 内部方法");
              //     return Text(store.price.toString());
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
