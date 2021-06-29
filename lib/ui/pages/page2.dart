import 'package:first_flutter_app/ui/pages/provider2_demo.dart';
import 'package:first_flutter_app/ui/pages/provider_demo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ProviderDemoModel>(context);

    print("build Page2页面");
    return ChangeNotifierProvider(
      create: (_) => Provider2DemoModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("页面二"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              AddButton(),
              ReduceButton(),
              Text(store.price.toString()),
              RedPart(),
              BluePart(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build-----------AddButton");
    return Consumer(
      builder: (context, ProviderDemoModel snapshot, child) {
        return TextButton(
          child: Text("ProviderDemoModel ➕"),
          onPressed: () {
            print("加号区域");
            snapshot.add();
          },
        );
      },
    );
  }
}

class ReduceButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build-----------ReduceButton");
    return Consumer(
        builder: (context, ProviderDemoModel snapshot, child) {
          return TextButton(
            child: Text("ProviderDemoModel -"),
            onPressed: () {
              print("减号区域");
              snapshot.reduce();
            },
          );
        },
        child: SizedBox());
  }
}

class RedPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build-----------RedPart");
    return Consumer(
      builder: (context, ProviderDemoModel snapshot, child) {
        print("RedPart特定部分区域");
        // return Text("Provider2DemoModel 标题", style: TextStyle(color: Colors.red));
        return child;
      },
      child: _t(context),
    );
  }

  Widget _t(context) {
    print("RedPart标题区域");
    return Text("Provider2DemoModel 标题", style: TextStyle(color: Colors.red));
  }
}

class BluePart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build-----------BluePart");
    return Consumer(
      builder: (context, ProviderDemoModel snapshot, child) {
        print("BluePart特定部分区域");
        return Text("Provider2DemoModel 标题", style: TextStyle(color: Colors.blue));
      },
    );
  }
}
