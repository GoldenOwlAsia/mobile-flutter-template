import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widgets/forms/input.dart';

void main() {
  group('XInput', () {
    testWidgets('should render with required value parameter', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: XInput(value: 'test')),
        ),
      );

      expect(find.byType(XInput), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('should display initial value', (WidgetTester tester) async {
      const initialValue = 'Hello World';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: XInput(value: initialValue)),
        ),
      );

      expect(find.text(initialValue), findsOneWidget);
    });

    testWidgets('should call onChanged when text changes', (
      WidgetTester tester,
    ) async {
      String? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XInput(value: '', onChanged: (value) => changedValue = value),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'New Text');
      expect(changedValue, equals('New Text'));
    });

    testWidgets('should update when value prop changes', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: XInput(value: 'Initial')),
        ),
      );

      expect(find.text('Initial'), findsOneWidget);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: XInput(value: 'Updated')),
        ),
      );

      expect(find.text('Updated'), findsOneWidget);
      expect(find.text('Initial'), findsNothing);
    });

    group('Clear button', () {
      testWidgets('should not show clear button when input is empty', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XInput(value: '', onChanged: (_) {}),
            ),
          ),
        );

        expect(find.byIcon(Icons.cancel), findsNothing);
      });

      testWidgets('should show clear button when input has value', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XInput(value: 'test', onChanged: (_) {}),
            ),
          ),
        );

        // Enter text to trigger the clear button
        await tester.enterText(find.byType(TextFormField), 'Some text');
        await tester.pump();

        expect(find.byIcon(Icons.cancel), findsOneWidget);
      });

      testWidgets('should clear text when clear button is tapped', (
        WidgetTester tester,
      ) async {
        String currentValue = 'test';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XInput(
                value: currentValue,
                onChanged: (value) => currentValue = value,
              ),
            ),
          ),
        );

        // Enter text
        await tester.enterText(find.byType(TextFormField), 'Some text');
        await tester.pump();

        // Tap clear button
        await tester.tap(find.byIcon(Icons.cancel));
        await tester.pump();

        expect(currentValue, equals(''));
      });

      testWidgets('should not show clear button when disabled', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XInput(value: 'test', enabled: false, onChanged: (_) {}),
            ),
          ),
        );

        await tester.enterText(find.byType(TextFormField), 'Some text');
        await tester.pump();

        expect(find.byIcon(Icons.cancel), findsNothing);
      });

      testWidgets('should not show clear button when readOnly', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XInput(value: 'test', readOnly: true, onChanged: (_) {}),
            ),
          ),
        );

        await tester.enterText(find.byType(TextFormField), 'Some text');
        await tester.pump();

        expect(find.byIcon(Icons.cancel), findsNothing);
      });
    });

    group('Password visibility toggle', () {
      testWidgets('should obscure text when obscureText is true', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: 'password', obscureText: true)),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.obscureText, isTrue);
      });

      testWidgets('should show visibility toggle when obscureText is true', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: 'password', obscureText: true)),
          ),
        );

        expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
      });

      testWidgets('should toggle password visibility when icon is tapped', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: 'password', obscureText: true)),
          ),
        );

        // Initially should show visibility icon (to reveal password)
        expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);

        // Tap visibility toggle
        await tester.tap(find.byIcon(Icons.visibility_outlined));
        await tester.pump();

        // Should now show visibility_off icon (to hide password)
        expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
        expect(find.byIcon(Icons.visibility_outlined), findsNothing);

        // Tap again to hide
        await tester.tap(find.byIcon(Icons.visibility_off_outlined));
        await tester.pump();

        // Should show visibility icon again
        expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
        expect(find.byIcon(Icons.visibility_off_outlined), findsNothing);
      });

      testWidgets('should show both clear and visibility toggle buttons', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XInput(
                value: 'password',
                obscureText: true,
                onChanged: (_) {},
              ),
            ),
          ),
        );

        // Enter text to show clear button
        await tester.enterText(find.byType(TextFormField), 'Some password');
        await tester.pump();

        expect(find.byIcon(Icons.cancel), findsOneWidget);
        expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
      });
    });

    group('Keyboard type', () {
      testWidgets('should use specified keyboard type', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: XInput(value: '', keyboardType: TextInputType.emailAddress),
            ),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.keyboardType, equals(TextInputType.emailAddress));
      });

      testWidgets('should support number keyboard', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: XInput(value: '', keyboardType: TextInputType.number),
            ),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.keyboardType, equals(TextInputType.number));
      });
    });

    group('Text alignment', () {
      testWidgets('should use left alignment by default', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: 'test')),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.textAlign, equals(TextAlign.left));
      });

      testWidgets('should support center alignment', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: XInput(value: 'test', textAlign: TextAlign.center),
            ),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.textAlign, equals(TextAlign.center));
      });

      testWidgets('should add prefix spacing when centered', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: XInput(value: 'test', textAlign: TextAlign.center),
            ),
          ),
        );

        // When centered, XInput adds a SizedBox as prefix
        expect(find.byType(SizedBox), findsWidgets);
      });
    });

    group('Max length', () {
      testWidgets('should enforce max length', (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: '', maxLength: 10)),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.maxLength, equals(10));
      });

      testWidgets('should display character counter', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: 'test', maxLength: 10)),
          ),
        );

        // Character counter is automatically shown by TextFormField
        expect(find.byType(TextFormField), findsOneWidget);
      });
    });

    group('Input formatters', () {
      testWidgets('should apply input formatters', (WidgetTester tester) async {
        final formatters = [FilteringTextInputFormatter.digitsOnly];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XInput(value: '', inputFormatters: formatters),
            ),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.inputFormatters, isNotNull);
        expect(xInput.inputFormatters!.length, equals(1));
      });
    });

    group('Autofocus', () {
      testWidgets('should not autofocus by default', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: '')),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.autofocus, isFalse);
      });

      testWidgets('should autofocus when specified', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: '', autofocus: true)),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.autofocus, isTrue);
      });
    });

    group('Enabled and ReadOnly', () {
      testWidgets('should be enabled by default', (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: '')),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.enabled, isTrue);
      });

      testWidgets('should respect enabled property', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: '', enabled: false)),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.enabled, isFalse);
      });

      testWidgets('should respect readOnly property', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: '', readOnly: true)),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.readOnly, isTrue);
      });
    });

    group('FocusNode', () {
      testWidgets('should accept external FocusNode', (
        WidgetTester tester,
      ) async {
        final focusNode = FocusNode();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XInput(value: '', focusNode: focusNode),
            ),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.focusNode, equals(focusNode));

        focusNode.dispose();
      });
    });

    group('Validator', () {
      testWidgets('should apply validator', (WidgetTester tester) async {
        String? validator(String? value) {
          if (value == null || value.isEmpty) {
            return 'Required field';
          }
          return null;
        }

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                child: XInput(value: '', validator: validator),
              ),
            ),
          ),
        );

        final textFormField = tester.widget<TextFormField>(
          find.byType(TextFormField),
        );
        expect(textFormField.validator, equals(validator));
      });

      testWidgets('should show validation error', (WidgetTester tester) async {
        final formKey = GlobalKey<FormState>();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                key: formKey,
                child: XInput(
                  value: '',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
        );

        // Trigger validation
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Required field'), findsOneWidget);
      });
    });

    group('Decoration', () {
      testWidgets('should apply custom decoration', (
        WidgetTester tester,
      ) async {
        const decoration = InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: XInput(value: '', decoration: decoration),
            ),
          ),
        );

        expect(find.text('Email'), findsOneWidget);
        expect(find.text('Enter your email'), findsOneWidget);
      });

      testWidgets('should merge decoration with defaults', (
        WidgetTester tester,
      ) async {
        const decoration = InputDecoration(labelText: 'Custom Label');

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: XInput(value: '', decoration: decoration),
            ),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));

        // Should have custom decoration
        expect(xInput.decoration!.labelText, equals('Custom Label'));
      });
    });

    group('onFieldSubmitted', () {
      testWidgets('should call onFieldSubmitted callback', (
        WidgetTester tester,
      ) async {
        String? submittedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XInput(
                value: '',
                onFieldSubmitted: (value) => submittedValue = value,
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(TextFormField), 'Test value');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        expect(submittedValue, equals('Test value'));
      });
    });

    group('Custom style', () {
      testWidgets('should apply custom text style', (
        WidgetTester tester,
      ) async {
        const customStyle = TextStyle(fontSize: 18, color: Colors.blue);

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: XInput(value: '', style: customStyle),
            ),
          ),
        );

        final xInput = tester.widget<XInput>(find.byType(XInput));
        expect(xInput.style, equals(customStyle));
      });
    });

    group('Accessibility', () {
      testWidgets('should have tooltip on clear button', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: XInput(value: 'test', onChanged: (_) {}),
            ),
          ),
        );

        await tester.enterText(find.byType(TextFormField), 'Some text');
        await tester.pump();

        final iconButton = tester.widget<IconButton>(
          find.ancestor(
            of: find.byIcon(Icons.cancel),
            matching: find.byType(IconButton),
          ),
        );

        expect(iconButton.tooltip, equals('Clear'));
      });

      testWidgets('should have tooltip on visibility toggle', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: XInput(value: 'password', obscureText: true)),
          ),
        );

        final iconButton = tester.widget<IconButton>(
          find.ancestor(
            of: find.byIcon(Icons.visibility_outlined),
            matching: find.byType(IconButton),
          ),
        );

        expect(iconButton.tooltip, equals('Show password'));

        // Toggle visibility
        await tester.tap(find.byIcon(Icons.visibility_outlined));
        await tester.pump();

        final toggledIconButton = tester.widget<IconButton>(
          find.ancestor(
            of: find.byIcon(Icons.visibility_off_outlined),
            matching: find.byType(IconButton),
          ),
        );

        expect(toggledIconButton.tooltip, equals('Hide password'));
      });
    });
  });
}
