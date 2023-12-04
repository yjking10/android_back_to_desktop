import 'android_back_to_desktop_platform_interface.dart';

class AndroidBackToDesktop {
  Future<String?> getPlatformVersion() {
    return AndroidBackToDesktopPlatform.instance.getPlatformVersion();
  }

  Future<bool?> backToDesktop() {
    return AndroidBackToDesktopPlatform.instance.backToDesktop();
  }
}
