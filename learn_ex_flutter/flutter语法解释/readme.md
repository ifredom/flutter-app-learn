# 语法解释

## 操作符

> ??=

```java
> b ??= value
// 如果 b 是 null，则赋值给 b；
// 如果不是 null，则 b 的值保持不变
AA ??= "999" ///表示如果 AA 为空，给 AA 设置成 999
AA ~/999 ///AA 对于 999 整除
```

> ?.

```java

//定义类
class Person {
  var name;
  Person(this.name);
}

// 调用
Person p;
var name = p?.name; //先判断p是否为null，如果是，则name为null；如果否，则返回p.name值
print("name = $name");

// 输出结果
name = null

```

>> ??

```java
// 操作代码块
String name;
String nickName = name ?? "Nick"; //如果name不为null，则nickName值为name的值，否则值为Nick
print("nickName = $nickName");
```

## 方法

- **toList()**
  - Creates a List containing the elements of this Iterable. The elements are in iteration order. The list is fixed-length if growable is false.

```java
List<E> toList ({
bool growable: true
})
```
