import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_back_to_desktop_platform_interface.dart';

/// An implementation of [AndroidBackToDesktopPlatform] that uses method channels.
class MethodChannelAndroidBackToDesktop extends AndroidBackToDesktopPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_back_to_desktop');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> backToDesktop() async {
    final version = await methodChannel.invokeMethod<bool>('backToDesktop');
    return version;
  }
}
