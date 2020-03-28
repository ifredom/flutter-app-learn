# Dart

Dart是一种强类型、跨平台的客户端开发语言。具有专门为客户端优化、高生产力、快速高效、可移植（兼容ARM/x86）、易学的OO编程风格和原生支持响应式编程（Stream & Future）等优秀特性。Dart主要由Google负责开发和维护，在2011年10启动项目，2017年9月发布第一个2.0-dev版本。

Dart本身提供了三种运行方式：

- 使用Dart2js编译成JavaScript代码，运行在常规浏览器中（Dart Web）。
- 使用DartVM直接在命令行中运行Dart代码（DartVM）。
- AOT方式编译成机器码，例如Flutter App框架（Flutter）。


Dart中类似线程的概念叫做`Isolate`，每个Isolate之间是无法共享内存的，所以这种分配策略可以让Dart实现无锁的快速分配。

## 语法对比

```java
> new List()  vs  new Array()

> new Map()   vs   《 {} or new Object() 》

is 判断数据类型
```

## 尖括号修饰符用在哪里

```java
List<num> arr = [1, 2, 3];
List arr = <num>[1, 2, 3];
```

## 运算

num a = 1;
num c = ++a; // 变量赋值时，加加卸载前面，先运算，后赋值。
a++;

print(a);
print(c);

## List 数组操作方法

forEach()
