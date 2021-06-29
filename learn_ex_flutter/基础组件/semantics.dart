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
    this.text: 'default text',
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '被semantics包裹的组件，对搜索引擎而言，如同一个关键词',
      child: Row(
        children: <Widget>[
          ElevatedButton(
            child: Text("normal"),
            onPressed: () {
              print('test');
            },
          ),
          TextButton(
            // color: Colors.blue[700],
            // highlightColor: Colors.black87,
            // colorBrightness: Brightness.dark,
            // splashColor: Colors.grey,
            child: Text('flatbutton'),
            onPressed: () {
              print('flatbutton');
            },
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
            child: Text('flatbutton'),
            onPressed: () {
              print('flatbutton');
            },
          ),
        ],
      ),
    );
  }
}
