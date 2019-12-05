# typedef

官方说明：

- In Dart, functions are objects, just like strings and numbers are objects. A typedef, or function-type alias, gives a function type a name that you can use when declaring fields and return types. A typedef retains type information when a function type is assigned to a variable.

翻译:

- 在 Dart 中，方法与 object，字符串，数字这几种类型一样都被称之为`对象`.一个 typedef 或者一个方法的 alias，为函数类型提供一个名称，在声明字段和返回类型时可以使用该名称。当函数类型分配给变量时，typedef 保留类型信息。

理解：
这句话的意思是说，如同 object，boolean，number 这几种被称为基本类型一样，typedef 的作用是可以自定义一种数据类型，并且这种数据类型属于 函数类型。同时 typedef 可以保留函数签名信息

## 适用场景

- 通常用于定义回调函数时使用
- 定义类时，类只包含一个名字无意义的函数时，最好使用 typedef 去定义方法.（例如：我们只是需要一个方法时，步通过 class 去定义，而使用 typedef）

```java
// good
typedef Predicate<E> = bool Function(E element);

// bad
abstract class Predicate<E> {
  bool test(E element);
}
```

```java
// good
typedef OutputFunction = void Function(String msg);

// bad
abstract class OutputFunction<E> {
  void output(E element);
}
```

## ValueChanged

typedef 在如何在 flutter 中的应用的呢？

---

例如： 源码中写道 ValueChanged 就是使用 typedef 定义：

```java
typedef ValueChanged<T>= void Function(T value);
```

使用方式:

```java
typedef Fly = void Function(int value); // 定义一个类型（方法），该方法需要传入一个int参数
void main(){
 Bird bird = Bird((int a){print(a);});//如果实参函数的类型不是该类型的话 编译不通过
 bird.fly(3);
}

class Bird{
 Fly fly;
 Bird(this.fly);
}
```
