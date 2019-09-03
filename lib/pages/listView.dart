import 'package:flutter/material.dart';

// 抽屉
// 用法：HomeBuilder.drwarRender()

class HomeBuilder {

  static Widget drwarRender(){
    return new Drawer(
      child:HomeBuilder.homeDrawer()
    );
  }
  static Widget homeDrawer() {
    return new ListView(padding: const EdgeInsets.only(), children: <Widget>[
      new ClipRect(
        child: new ListTile(
          leading: new CircleAvatar(child: new Text("A")),
          title: new Text('Drawer item A'),
          onTap: () => {},
        ),
      ),
      new ListTile(
        leading: new CircleAvatar(child: new Text("B")),
        title: new Text('Drawer item B'),
        subtitle: new Text("Drawer item B subtitle"),
        onTap: () => {},
      ),
      new AboutListTile(
        icon: new CircleAvatar(child: new Text("Ab")),
        child: new Text("About"),
        applicationName: "Test",
        applicationVersion: "1.0",
        applicationIcon: new Image.network('http://img3.imgtn.bdimg.com/it/u=1910932285,462253340&fm=26&gp=0.jpg'),
        applicationLegalese: "applicationLegalese",
        aboutBoxChildren: <Widget>[
          new Text("BoxChildren"),
          new Text("box child 2")
        ],
      ),
    ]);
  }


}
