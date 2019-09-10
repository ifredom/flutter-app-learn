import 'package:first_flutter_app/pages/first_page/first_page.dart';
import 'package:first_flutter_app/pages/second_page/second_page.dart';
import 'package:first_flutter_app/pages/third_page/third.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Widget> _list = List();
  int _currentIndex = 0;
  String appBarTitle;
  List tabData = [
    {'text': '菜单一', 'icon': Icon(Icons.extension)},
    {'text': '菜单二', 'icon': Icon(Icons.import_contacts)},
    {'text': '菜单三', 'icon': Icon(Icons.account_circle)},
    //https://flutter-go.pub/api/isInfoOpen
  ];
  List<BottomNavigationBarItem> _myTabs = [];

  @override
  void initState() {
    super.initState();

    appBarTitle = tabData[0]['text'];

    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }

    _list..add(FirstPage())..add(SecondPage())..add(ThirdPage());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('flutter-APP应用')),
      // body: Text('dispose'),
      body: IndexedStack(
        index: _currentIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _itemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _itemTapped(int index) {
    setState(() {
      print(index);
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }
}
