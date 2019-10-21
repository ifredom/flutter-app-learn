import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final num id;
  Page3({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 创建实例
    MySingleton myObj1 = MySingleton(1); // 返回单例
    print('myObj1: ${myObj1.instanceVar}');
    print('myObj1.instanceFun(): ${myObj1.instanceFun()}');
    print('myObj1.instanceStaticFun(): ${MySingleton.instanceStaticFun()}');

    // 再次创建实例
    MySingleton myObj2 = MySingleton(2); // still getting back the singleton
    print('myObj2: ${myObj2.instanceVar}');

    print(myObj1 == myObj2);

    return Scaffold(body: Text('测试页面'));
  }
}

/// 单例模式.无论传入什么值，都只返回同一个实例
class MySingleton {
  num instanceVar;
  static num start;

  // 非静态方法，通过实例创建后使用
  instanceFun() {
    return start;
  }

  /// 静态方法，直接通过类方法调用 MySingleton.instanceStaticFun()
  static instanceStaticFun() {
    return start;
  }

  /// MySingleton._internal() 在构造函数设置 start类变量 后仅调用一次。
  static final MySingleton _singleton = new MySingleton._internal();

  /// 只有使用 static 标识的静态成员，才可以在factory函数中被初始化.
  factory MySingleton(num startparam) {
    start = startparam;
    return _singleton;
  }

  MySingleton._internal() {
    if (instanceVar == null) {
      instanceVar = start;
    } else {
      instanceVar++;
    }
  }
}
