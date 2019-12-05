# rebuild

1）把 Scaffold 的 resizeToAvoidBottomInset 属性设置为 false，这样在键盘弹出时将不会 resize

2）把写死的高度改为 原高度 - MediaQuery.of(context).viewInsets.bottom，键盘弹出时布局将重建，而这个 MediaQuery.of(context).viewInsets.bottom 变量在键盘弹出前是 0，键盘弹起后的就是键盘的高度
