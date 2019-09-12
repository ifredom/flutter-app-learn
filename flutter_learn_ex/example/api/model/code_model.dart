import 'package:first_flutter_app/api/model/error_model.dart';
import 'package:first_flutter_app/event/event_bus.dart';

/// 错误编码
class Code {
  /// 网络错误
  static const NETWORK_ERROR = -1;

  /// 网络超时
  static const NETWORK_TIMEOUT = -2;

  /// 网络返回数据格式化一次
  static const NETWORK_JSON_EXCEPTION = -3;

  static const SUCCESS = 200;

  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    ApplicationEvent.event.fire(new HttpErrorEvent(code, message));
    return message;
  }
}
