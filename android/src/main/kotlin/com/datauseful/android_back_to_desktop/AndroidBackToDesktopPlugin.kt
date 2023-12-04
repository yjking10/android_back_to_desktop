package com.datauseful.android_back_to_desktop

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.content.Context
import android.content.Intent
/** AndroidBackToDesktopPlugin */
class AndroidBackToDesktopPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
    private var mContext: Context? = null


  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    mContext = flutterPluginBinding.getApplicationContext();
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_back_to_desktop")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if(call.method == "backToDesktop"){
      //返回桌面
      val intent = Intent();// 创建Intent对象
      intent.action = Intent.ACTION_MAIN;// 设置Intent动作
      intent.addCategory(Intent.CATEGORY_HOME);// 设置Intent种类
      intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);//标记
      mContext?.startActivity(intent);
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
