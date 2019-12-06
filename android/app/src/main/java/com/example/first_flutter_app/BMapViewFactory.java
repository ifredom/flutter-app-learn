package com.example.first_flutter_app;

import android.content.Context;
import android.view.View;

import com.baidu.mapapi.map.MapView;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;


// https://juejin.im/post/5bed04d96fb9a049a42e9c40
public class BMapViewFactory extends PlatformViewFactory {
    private MapView mapView;

    public BMapViewFactory(MessageCodec<Object> createArgsCodec, MapView mapView) {
        super(createArgsCodec);
        this.mapView = mapView;
    }

    @Override
    public PlatformView create(final Context context, int i, Object o) {
        return new PlatformView() {
            @Override
            public View getView() {
                return mapView;
            }

            @Override
            public void dispose() {
                mapView.onResume();
            }
        };
    }
}