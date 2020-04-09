import 'package:first_flutter_app/core/utils/common/colorUtils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SemanticsDemoWidget());
}

// samantics组件是一个辅助组件，用来表述widget的实际语义。
// 适用场景：为seo,或屏幕阅读器而准备.
// 组件效果：被包裹的组件，在semantics tree 语义树中被标记为一个节点，用于搜索引擎搜索/
class SemanticsDemoWidget extends StatelessWidget {
  const SemanticsDemoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Semantics(
          label: '被semantics包裹的组件，对搜索引擎而言，如同一个关键词',
          child: Row(
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "normal",
                  style: TextStyle(color: HexToColor('')),
                ),
                onPressed: () {
                  print('test');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
