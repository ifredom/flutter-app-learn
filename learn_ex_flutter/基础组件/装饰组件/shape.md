# shape

> 多层边框（层层嵌套）

```java
Container(
  decoration: ShapeDecoration(
    shape: Border.all(color: Colors.red, width: 8.0) +
        Border.all(
          color: Colors.green,
          width: 8.0,
        ) +
        Border.all(
          color: Colors.blue,
          width: 8.0,
        ),
  ),
  child: const Text('RGB', textAlign: TextAlign.center),
);
```

> 矩形边角

```java
Container(
  decoration: ShapeDecoration(
      color: Colors.pink,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      )),
  child: const Text('RGB', textAlign: TextAlign.center),
);
```
