import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

//determine if the app is running on an emulator or a real device
Future<String> determineEmulatorHost() async {
  if (Platform.isAndroid) {
    final info = await DeviceInfoPlugin().androidInfo;
    final fingerprint = info.fingerprint;
    final model = info.model.toLowerCase();
    final isEmulator = fingerprint.startsWith('generic') || model.contains('emulator');
    return isEmulator ? '10.0.2.2' : '192.168.15.9';
  }
  return 'localhost';
}
