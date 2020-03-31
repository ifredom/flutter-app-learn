import 'package:flutter/widgets.dart';

import 'dialog_service.dart';

class DialogServiceImpl implements DialogService {
  final _dialogNavigationKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get dialogNavigationKey => _dialogNavigationKey;
}
