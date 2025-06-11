import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_olliefy/screens/main_screen.dart';

void main() {
  pumpMainScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MainScreen(
          precacheFuture: Future.value(),
        )
      )
    );
    await tester.pumpAndSettle();
  }

  testWidgets('Main Screen: Smoke Test', (WidgetTester tester) async {
    await pumpMainScreen(tester);
    final loginBtn = find.byKey(const ValueKey('login_button'));
    expect(loginBtn, findsOneWidget);
    final registerBtn = find.byKey(const ValueKey('register_button'));
    expect(registerBtn, findsOneWidget);
  });
}
