import 'package:flutter/material.dart';

// Scaffold.of(context)找不到context时，可以使用Builder组件
// 默认 Scaffold.of(context) 中的context指向的是根组件，即 MaterialApp 创建时的context上下文
class BuilderApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Builder(
        builder: (ctx) => RaisedButton(
            textColor: Colors.red,
            child: Text('Submit'),
            onPressed: () {
              Scaffold.of(ctx).showSnackBar(
                SnackBar(
                  content: Text('Profile Save'),
                ),
              );
            }),
      ),
    );
  }
}
