package com.example.first_flutter_app;

import android.content.Context;

import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

import static io.flutter.plugin.common.PluginRegistry.Registrar;

public class MyEChartsViewFactory extends PlatformViewFactory {

    private final Registrar mPluginRegistrar;

    public MyEChartsViewFactory(Registrar registrar) {
        super(StandardMessageCodec.INSTANCE);
        mPluginRegistrar = registrar;
    }

    @Override
    public PlatformView create(Context context, int i, Object o) {
        return new MyEChartsWeb(context,mPluginRegistrar,i);
    }
}
