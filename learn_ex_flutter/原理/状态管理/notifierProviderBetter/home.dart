import 'dart:collection';
import 'package:flutter/material.dart';
import './ChangeNotifierProvider.dart';

// 商品信息
class Item {
  Item(this.price, this.count);
  double price;
  int count;
}

// 购物车商品数据CartModel类
class CartModel extends ChangeNotifier {
  // 购物车里商品列表
  final List<Item> _items = [];

  // 禁止改变购物车内商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice => _items.fold(0, (value, item) => value + item.count * item.price);

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(Item item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(
            builder: (context) {
              return Column(
                children: <Widget>[
                  Consumer<CartModel>(
                    builder: (context, cart) => Text("总价: ${cart.totalPrice}"),
                  ),
                  Builder(
                    builder: (BuildContext context) {
                      print("RaisedButton build"); // 优化会用到
                      return RaisedButton(
                        child: Text("添加商品"),
                        onPressed: () {
                          // 给购物车中商品，添加后总价会更新
                          ChangeNotifierProvider.of<CartModel>(
                            context,
                          ).add(Item(20.0, 1));
                        },
                      );
                    },
                  )
                ],
              );
            },
          )),
    );
  }
}

class Consumer<T> extends StatelessWidget {
  Consumer({
    Key key,
    @required this.builder,
    this.child,
  })  : assert(builder != null),
        super(key: key);

  final Widget child;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context));
  }
}
