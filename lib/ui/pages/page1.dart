import 'package:first_flutter_app/locator.dart';
import 'package:first_flutter_app/ui/pages/provider2_demo.dart';
import 'package:first_flutter_app/ui/pages/provider_demo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'page2.dart';

class Page1Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build Page1页面");
    return ViewModelBuilder<ProviderDemoModel>.nonReactive(
      viewModelBuilder: () => ProviderDemoModel(),
      builder: (context, model, child) => SafeArea(
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
                    // final store = Provider.of<ProviderDemoModel>(
                    //   context,
                    // );
                    // store.add();
                    // final store2 = Provider.of<Provider2DemoModel>(
                    //   context,
                    // );
                    // store2.setTitle();

                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (_) => Page2Demo(),
                      ),
                    );
                  },
                ),
                Consumer<ProviderDemoModel>(
                  builder: (context, snapshot, child) {
                    print("_build page1 内部方法");
                    return Text("${model.price.toString()}");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
