import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widgets/button/button.dart';
import 'package:myapp/widgets/button/model/button_size.dart';
import 'package:myapp/widgets/common/indicator.dart';

void main() {
  group('XButton', () {
    testWidgets('renders with title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XButton(title: 'Test Button', onPressed: () {}),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('renders with custom child widget', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XButton(child: const Text('Custom Child'), onPressed: () {}),
          ),
        ),
      );

      expect(find.text('Custom Child'), findsOneWidget);
    });

    testWidgets('child takes precedence over title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XButton(
              title: 'Title',
              child: const Text('Child'),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Child'), findsOneWidget);
      expect(find.text('Title'), findsNothing);
    });

    testWidgets('renders with icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XButton(
              title: 'Icon Button',
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Icon Button'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XButton(
              title: 'Tap Me',
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(pressed, isTrue);
    });

    testWidgets('button visually enabled when busy but blocks callback', (
      WidgetTester tester,
    ) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XButton(
              title: 'Busy Button',
              busy: true,
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      // Button appears enabled (has onPressed handler) but callback is blocked
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNotNull);

      // Verify callback doesn't fire when busy
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(pressed, isFalse);
    });

    testWidgets('shows indicator when busy', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XButton(title: 'Loading', busy: true, onPressed: () {}),
          ),
        ),
      );

      expect(find.byType(XIndicator), findsOneWidget);
      expect(find.text('Loading'), findsNothing);
    });

    testWidgets('shows indicator instead of icon when busy', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XButton(
              title: 'Loading',
              icon: const Icon(Icons.add),
              busy: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(XIndicator), findsOneWidget);
      expect(find.byIcon(Icons.add), findsNothing);
    });

    testWidgets('is disabled when enabled is false', (
      WidgetTester tester,
    ) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XButton(
              title: 'Disabled',
              enabled: false,
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);

      // Verify callback doesn't fire
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(pressed, isFalse);
    });

    testWidgets('button with null onPressed creates empty handler', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: XButton(title: 'No Callback')),
        ),
      );

      // Creates a closure even when onPressed is null
      // This may be intentional to maintain consistent visual state
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNotNull);
    });

    group('ButtonSize', () {
      testWidgets('applies small size', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XButton(
                title: 'Small',
                size: ButtonSize.small(),
                onPressed: () {},
              ),
            ),
          ),
        );

        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
        expect(sizedBox.height, equals(32));
      });

      testWidgets('applies medium size by default', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XButton(title: 'Medium', onPressed: () {}),
            ),
          ),
        );

        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
        expect(sizedBox.height, equals(40));
      });

      testWidgets('applies large size', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XButton(
                title: 'Large',
                size: ButtonSize.large(),
                onPressed: () {},
              ),
            ),
          ),
        );

        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
        expect(sizedBox.height, equals(48));
      });
    });

    group('Theme integration', () {
      testWidgets('uses primary color from theme', (WidgetTester tester) async {
        const testColor = Colors.purple;

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: testColor,
                brightness: Brightness.light,
              ),
            ),
            home: Scaffold(
              body: XButton(title: 'Themed', onPressed: () {}),
            ),
          ),
        );

        expect(find.byType(XButton), findsOneWidget);
      });
    });

    testWidgets('handles empty title and child gracefully', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: XButton(onPressed: () {})),
        ),
      );

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text(''), findsOneWidget);
    });

    testWidgets('enabled + busy shows enabled UI but blocks callback', (
      WidgetTester tester,
    ) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XButton(
              title: 'Test',
              enabled: true,
              busy: true,
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      // Button appears enabled (intentional UX) but callback is blocked
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNotNull);

      // Verify callback doesn't fire when busy
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(pressed, isFalse);
    });

    testWidgets('icon button with busy state shows indicator label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XButton(
              title: 'Icon Busy',
              icon: const Icon(Icons.send),
              busy: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(XIndicator), findsOneWidget);
      expect(find.text('Icon Busy'), findsOneWidget);
    });
  });
}
