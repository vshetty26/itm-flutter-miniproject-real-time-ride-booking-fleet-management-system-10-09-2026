// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rideflow/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('signs in and shows the ride booking dashboard', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const RideFlowApp());
    await tester.pumpAndSettle();

    expect(find.text('RideFlow'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(0), 'alex@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'secret123');
    final signInButton = find.widgetWithText(FilledButton, 'Sign in');
    await tester.ensureVisible(signInButton);
    await tester.tap(signInButton);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Where are you going?').first, findsOneWidget);
    expect(find.text('Live route').first, findsOneWidget);
    await tester.drag(find.byType(ListView).first, const Offset(0, -500));
    await tester.pump();
    expect(find.text('Request ride'), findsOneWidget);
    await tester.tap(find.text('Request ride'));
    await tester.pump();
    expect(find.text('Driver search in progress'), findsOneWidget);
  });

  testWidgets('restores the signed-in session after refresh', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      'rideflow_user_logged_in': true,
      'rideflow_user_is_driver': true,
    });

    await tester.pumpWidget(const RideFlowApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Driver workspace'), findsOneWidget);
  });
}
