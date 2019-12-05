# onTap 技巧

InkWell 组件将可点击区域分为了四块区域，很容易被误触发。比如单手指点击在边界位置，可能会被识别为两手指

GestureDetector 可点击区域无划分

## 适用情况

InkWell 适用于需要多点触控的地方.

GestureDetector 适用几乎所有情况

## 触发报错

```java
I/PressGestureDetector(14372): ACTION_POINTER_DOWN.
I/PressGestureDetector(14372): HiTouch Miss: more than two pointers.
```

- ACTION_DOWN 用于触摸屏幕的第一根手指。这开始手势。该手指的指针数据在 MotionEvent 中始终位于索引 0。
- ACTION_POINTER_DOWN 适用于超出第一个手指进入屏幕的多余手指。该手指的指针数据位于 getActionIndex（）返回的索引处。
- 当一根手指离开屏幕但至少一根手指仍在触摸屏幕时，将发送 ACTION_POINTER_UP。关于手指上升的最后一个数据样本位于 getActionIndex（）返回的索引处。
- 当最后一根手指离开屏幕时发送 ACTION_UP。关于上升的手指的最后一个数据样本位于索引 0。这将结束手势。
- ACTION_CANCEL 表示整个手势由于某种原因被中止。手势结束。

### 参考资料

[ACTION_UP & ACTION_POINTER_UP](https://stackoverflow.com/questions/4268426/android-difference-between-action-up-and-action-pointer-up)
