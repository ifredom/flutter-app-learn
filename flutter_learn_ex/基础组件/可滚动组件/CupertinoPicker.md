# CupertinoPicker()

参数

diameterRatio: 曲率

## 示例

滚轮曲面效果

```java
CupertinoPicker(
  itemExtent: 20,
  scrollController: controller,
  onSelectedItemChanged: (position) {
    print('The position is $position');
  },
  children: List<Widget>.generate(12, (int index) {
    return Container(
      height: 50.0,
      width: 300.0,
      child: Text(index.toString()),
    );
  }),
)
```

平面滑动

```java
CupertinoPicker(
  itemExtent: 20,
  scrollController: controller,
  onSelectedItemChanged: (position) {
    print('The position is $position');
  },
  children: [
    Text("0"),
    Text("1"),
    Text("2"),
    Text("3"),
    Text("4"),
  ],
)
```
