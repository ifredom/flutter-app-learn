# 语法解释

## 操作符

> ??=

```java
> b ??= value
// 如果 b 是 null，则赋值给 b；
             // 如果不是 null，则 b 的值保持不变
```

> ?.

```java

> foo?.bar
// 左边的操作对象不能为 null，
// 如果 foo 为 null 则返回 null，否则返回 bar 成员
```

## 方法

- **toList()**
  - Creates a List containing the elements of this Iterable. The elements are in iteration order. The list is fixed-length if growable is false.

```java
List<E> toList ({
bool growable: true
})
```
