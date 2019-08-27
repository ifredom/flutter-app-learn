# 状态管理

StatefulWidget的状态应该被谁管理？Widget本身？父Widget？都会？还是另一个对象？答案是取决于实际情况！以下是管理状态的最常见的方法：

* Widget管理自己的状态。(manageSelf.dart)
* Widget管理子Widget状态。(parentManageChild.dart)
* 混合管理（父Widget和子Widget都管理状态）(mixinManage.dart)

## 何时适用何种管理方式

如何决定使用哪种管理方法？下面是官方给出的一些原则可以帮助你做决定：

* 如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父Widget管理。
* 如果状态是有关界面外观效果的，例如颜色、动画，那么状态最好由Widget本身来管理。
* 如果某一个状态是不同Widget共享的则最好由它们共同的父Widget管理。

在Widget内部管理状态封装性会好一些，而在父Widget中管理会比较灵活。有些时候，如果不确定到底该怎么管理状态，那么推荐的首选是在父widget中管理（灵活会显得更重要一些）。
