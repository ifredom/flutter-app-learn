import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void WebViewCreatedCallback(int id);

class PlatformNativeWeb extends StatefulWidget {

  const PlatformNativeWeb({
    Key key,
    @required this.onWebCreated,
  }) : super(key: key);

  final WebViewCreatedCallback onWebCreated;


  @override
  State createState() => new _PlatformNativeWebState();
}

class _PlatformNativeWebState extends State<PlatformNativeWeb> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {

      return AndroidView(
        viewType: 'my_echarts',
        onPlatformViewCreated: onPlatformCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'my_echarts',
        onPlatformViewCreated: onPlatformCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }

    return new Text(
        '$defaultTargetPlatform is not yet supported by this plugin');
  }

  Future<void> onPlatformCreated(id)  async {
    if (widget.onWebCreated == null) {
      return;
    }
    widget.onWebCreated(id);
  }
}



