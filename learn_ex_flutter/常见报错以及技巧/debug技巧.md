# how to debug

## hot Reload

不是所有的代码改动都可以通过热刷新来更新：

- 编译错误，如果修改后的 Dart 代码无法通过编译，Flutter 会在控制台报错，这时需要修改对应的代码。
- 控件类型从 StatelessWidget 到 StatefulWidget 的转换，因为 Flutter 在执行热刷新时会保留程序原来的 state，而某个控件从 stageless→stateful 后会导致 Flutter 重新创建控件时报错“myWidget is not a subtype of StatelessWidget”，而从 stateful→stateless 会报错“type ‘myWidget’ is not a subtype of type ‘StatefulWidget’ of ‘newWidget’”。
- 全局变量和静态成员变量，这些变量不会在热刷新时更新。
- 修改了 main 函数中创建的根控件节点，Flutter 在热刷新后只会根据原来的根节点重新创建控件树，不会修改根节点。
- 某个类从普通类型转换成枚举类型，或者类型的泛型参数列表变化，都会使热刷新失败。
