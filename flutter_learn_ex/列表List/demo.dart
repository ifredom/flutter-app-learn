import 'package:flutter/material.dart';

/// 使用 provider 创建列表
/// 地址: https://stackoverflow.com/questions/56359049/setting-provider-value-in-futurebuilder
class Sun extends StatelessWidget {
  Widget build(BuildContext context) {
    final appState = Provider.of<MySchedule>(context);
    var db = PostDB();

    Widget listBuild(appState) {
      final list = appState.myList;
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(list[index].title));
        },
      );
    }

    Widget futureBuild(appState) {
      return FutureBuilder(
        future: db.getPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // appState.myList = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(snapshot.data[index].title));
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    return Scaffold(
        body: appState.myList != null
            ? listBuild(appState)
            : futureBuild(appState));
  }
}
