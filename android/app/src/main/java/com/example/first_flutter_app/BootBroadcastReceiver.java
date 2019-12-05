package com.example.first_flutter_app;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/**
 * Created by ifredom on 2019/12/5.
 */
public class BootBroadcastReceiver extends BroadcastReceiver {
  static final String ACTION = "android.intent.action.BOOT_COMPLETED";

  @Override
  public void onReceive(Context context, Intent intent) {

    Log.i("charge start", "启动完成");

    if (intent.getAction().equals(ACTION)) {
      Intent mainActivityIntent = new Intent(context, MainActivity.class); // 要启动的Activity
      mainActivityIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
      context.startActivity(mainActivityIntent);
    }
  }
}