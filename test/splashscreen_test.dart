import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_olliefy/screens/splashscreen.dart';

void main() {
  pumpSplashscreen(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Splashscreen()
      ));
    await tester.pumpAndSettle();
  }

  testWidgets('Spĺashscreen: Smoke Test', (WidgetTester tester) async {
    await pumpSplashscreen(tester);

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.bySubtype<SvgPicture>(), findsOneWidget);
  });
}