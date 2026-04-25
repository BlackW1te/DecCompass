// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:dev_compass/app.dart';

void main() {
  testWidgets('renders the DevCompass shell', (WidgetTester tester) async {
    await tester.pumpWidget(const DevCompassApp());
    await tester.pumpAndSettle();

    expect(find.text('DevCompass'), findsOneWidget);
    expect(find.text('Merhaba, Ahmet 👋'), findsOneWidget);
  });
}
