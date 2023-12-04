import 'package:flutter_test/flutter_test.dart';
import 'package:android_back_to_desktop/android_back_to_desktop.dart';
import 'package:android_back_to_desktop/android_back_to_desktop_platform_interface.dart';
import 'package:android_back_to_desktop/android_back_to_desktop_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidBackToDesktopPlatform
    with MockPlatformInterfaceMixin
    implements AndroidBackToDesktopPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AndroidBackToDesktopPlatform initialPlatform = AndroidBackToDesktopPlatform.instance;

  test('$MethodChannelAndroidBackToDesktop is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidBackToDesktop>());
  });

  test('getPlatformVersion', () async {
    AndroidBackToDesktop androidBackToDesktopPlugin = AndroidBackToDesktop();
    MockAndroidBackToDesktopPlatform fakePlatform = MockAndroidBackToDesktopPlatform();
    AndroidBackToDesktopPlatform.instance = fakePlatform;

    expect(await androidBackToDesktopPlugin.getPlatformVersion(), '42');
  });
}
