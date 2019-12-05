import 'package:flutter/material.dart';

import 'page3.dart';

// class Page2 extends StatefulWidget {
//   // final num id;
//   // Page2({Key key, this.id}) : super(key: key);
//   @override
//   _Page2State createState() => _Page2State();
// }

// class _Page2State extends State<Page2> {
//   @override
//   Widget build(BuildContext context) {
//     print('page2 build');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('纯静态，无数据传递'),
//         // title: Text('${widget.id}'),
//       ),
//       body: RaisedButton(
//         child: Text('下一页'),
//         onPressed: () {
//           Navigator.of(context).push(new MaterialPageRoute(
//               builder: (_) => new Page3(id: 2), maintainState: true));
//         },
//       ),
//     );
//   }
// }

class Page2 extends StatelessWidget {
  final num id;
  Page2({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('page2 build');
    return Scaffold(
      appBar: AppBar(
        // title: Text('纯静态，无数据传递'),
        title: Text('$id'),
      ),
      body: RaisedButton(
        child: Text('下一页'),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (_) => new Page3(id: 2), maintainState: true));
        },
      ),
    );
  }
}
