import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:add_calendar/add_calendar.dart';

void main() {
  const MethodChannel channel = MethodChannel('add_calendar');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
  
}
