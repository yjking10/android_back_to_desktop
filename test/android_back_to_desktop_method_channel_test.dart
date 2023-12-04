import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_back_to_desktop/android_back_to_desktop_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAndroidBackToDesktop platform = MethodChannelAndroidBackToDesktop();
  const MethodChannel channel = MethodChannel('android_back_to_desktop');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
