import 'package:flutter/material.dart';

class IfredomGrid extends StatefulWidget {
  IfredomGrid({Key key}) : super(key: key);

  _IfredomGridState createState() => _IfredomGridState();
}

class _IfredomGridState extends State<IfredomGrid> {
  // List _icons = <Icon>[];
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return builderGridExtentWidget();
  }

  Widget fiexedCrossWidget() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 12, // 横轴数量
        childAspectRatio: 1, // 宽高比
      ),
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.beach_access),
        Icon(Icons.free_breakfast),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.beach_access),
        Icon(Icons.free_breakfast),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
        Icon(Icons.airport_shuttle),
        Icon(Icons.beach_access),
        Icon(Icons.free_breakfast),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
        Icon(Icons.free_breakfast),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }

  Widget maxCrossWidget() {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // 最大宽高
        childAspectRatio: 2, // 宽高比
      ),
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.beach_access),
        Icon(Icons.free_breakfast),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.beach_access),
        Icon(Icons.free_breakfast),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
        Icon(Icons.airport_shuttle),
        Icon(Icons.beach_access),
        Icon(Icons.free_breakfast),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
        Icon(Icons.free_breakfast),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }

  Widget maxGridExtentWidget() {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      childAspectRatio: 2,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.beach_access),
        Icon(Icons.free_breakfast),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.beach_access),
        Icon(Icons.free_breakfast),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }

  Widget builderGridExtentWidget() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemCount: _icons.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        });
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
