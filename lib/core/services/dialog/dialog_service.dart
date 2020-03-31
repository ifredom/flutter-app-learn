import 'package:flutter/widgets.dart';

/// 参考文章： https://medium.com/flutter-community/manager-your-flutter-dialogs-with-a-dialog-manager-1e862529523a
/// DialogManager：此类将是DialogService和UI之间的链接，以显示所需的对话框。
/// 它的职责是侦听来自服务的指令，执行它们，并在执行这些指令时告知服务。如果它已从交互中收集到任何信息，它将另外将信息发送回服务。
///
/// DialogService：此类将是从模型中获取指令并将其中继到的对象DialogManager。
/// 此外，它将停止调用线程的执行，直到DialogManager指示操作已完成。它将通过使用上述的Completer功能来实现此目的。
///
abstract class DialogService {
  GlobalKey<NavigatorState> get dialogNavigationKey;
}
