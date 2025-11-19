import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widgets/common/indicator.dart';

void main() {
  group('XIndicator', () {
    testWidgets('should render with default values',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: XIndicator(),
          ),
        ),
      );

      expect(find.byType(XIndicator), findsOneWidget);
    });

    testWidgets('should use custom radius', (WidgetTester tester) async {
      const customRadius = 20.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: XIndicator(radius: customRadius),
          ),
        ),
      );

      final indicator = tester.widget<XIndicator>(find.byType(XIndicator));
      expect(indicator.radius, equals(customRadius));
    });

    testWidgets('should accept custom color', (WidgetTester tester) async {
      const customColor = Colors.red;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: XIndicator(color: customColor),
          ),
        ),
      );

      final indicator = tester.widget<XIndicator>(find.byType(XIndicator));
      expect(indicator.color, equals(customColor));
    });

    testWidgets('should use default values when not provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: XIndicator(),
          ),
        ),
      );

      final indicator = tester.widget<XIndicator>(find.byType(XIndicator));
      expect(indicator.radius, equals(15.0));
      expect(indicator.color, isNull);
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      const indicator = XIndicator();
      expect(indicator, isA<StatelessWidget>());
    });
  });
}
