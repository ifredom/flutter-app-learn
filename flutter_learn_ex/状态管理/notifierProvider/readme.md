# 待优化点

优化后的代码 为同目录下的文件家： notifierProviderBetter

## 总价 Text 调用

```dash
Builder(builder: (context){
  var cart=ChangeNotifierProvider.of<CartModel>(context);
  return Text("总价: ${cart.totalPrice}");
})
```

1. 需要显式调用 ChangeNotifierProvider.of，当 APP 内部依赖 CartModel 很多时，这样的代码将很冗余。

2. 语义不明确；由于 ChangeNotifierProvider 是订阅者，那么依赖 CartModel 的 Widget 自然就是订阅者，其实也就是状态的消费者，如果我们用 Builder 来构建，语义就不是很明确；如果我们能使用一个具有明确语义的 Widget，比如就叫 Consumer，这样最终的代码语义将会很明确，只要看到 Consumer，我们就知道它是依赖某个跨组件或全局的状态。

`所以把他包装一下，类似于起一个别名.方便调用以及语义化调用方法来理解代码。`
