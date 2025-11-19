import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widgets/image/image_network.dart';

void main() {
  group('XImageNetwork', () {
    testWidgets('should display placeholder when url is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XImageNetwork(null),
          ),
        ),
      );

      // Should not find CachedNetworkImage
      expect(find.byType(CachedNetworkImage), findsNothing);

      // Should find a Container (placeholder)
      expect(find.byType(Container), findsOneWidget);

      // Verify placeholder has grey background
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.grey[200]));
    });

    testWidgets('should display CachedNetworkImage when url is valid',
        (WidgetTester tester) async {
      const testUrl = 'https://example.com/image.jpg';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XImageNetwork(testUrl),
          ),
        ),
      );

      // Should find CachedNetworkImage
      expect(find.byType(CachedNetworkImage), findsOneWidget);

      // Verify the imageUrl is set correctly
      final cachedImage =
          tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
      expect(cachedImage.imageUrl, equals(testUrl));
    });

    testWidgets('should apply width and height to CachedNetworkImage',
        (WidgetTester tester) async {
      const testUrl = 'https://example.com/image.jpg';
      const testWidth = 100.0;
      const testHeight = 200.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XImageNetwork(
              testUrl,
              width: testWidth,
              height: testHeight,
            ),
          ),
        ),
      );

      final cachedImage =
          tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
      expect(cachedImage.width, equals(testWidth));
      expect(cachedImage.height, equals(testHeight));
    });

    testWidgets('should apply BoxFit to CachedNetworkImage',
        (WidgetTester tester) async {
      const testUrl = 'https://example.com/image.jpg';
      const testFit = BoxFit.cover;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XImageNetwork(
              testUrl,
              fit: testFit,
            ),
          ),
        ),
      );

      final cachedImage =
          tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
      expect(cachedImage.fit, equals(testFit));
    });

    testWidgets('should display placeholder during image loading',
        (WidgetTester tester) async {
      const testUrl = 'https://example.com/image.jpg';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XImageNetwork(testUrl),
          ),
        ),
      );

      final cachedImage =
          tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));

      // Build the placeholder
      final placeholder = cachedImage.placeholder!(
        tester.element(find.byType(CachedNetworkImage)),
        testUrl,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: placeholder,
          ),
        ),
      );

      // Should find Container with grey background
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.grey[200]));
    });

    testWidgets('should display error widget on image load failure',
        (WidgetTester tester) async {
      const testUrl = 'https://example.com/image.jpg';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XImageNetwork(testUrl),
          ),
        ),
      );

      final cachedImage =
          tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));

      // Build the error widget
      final errorWidget = cachedImage.errorWidget!(
        tester.element(find.byType(CachedNetworkImage)),
        testUrl,
        Exception('Failed to load'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: errorWidget,
          ),
        ),
      );

      // Should find Container with grey background
      expect(find.byType(Container), findsOneWidget);

      // Should find error icon
      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('should handle all parameters together',
        (WidgetTester tester) async {
      const testUrl = 'https://example.com/image.jpg';
      const testWidth = 200.0;
      const testHeight = 300.0;
      const testFit = BoxFit.contain;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: XImageNetwork(
              testUrl,
              width: testWidth,
              height: testHeight,
              fit: testFit,
            ),
          ),
        ),
      );

      final cachedImage =
          tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
      expect(cachedImage.imageUrl, equals(testUrl));
      expect(cachedImage.width, equals(testWidth));
      expect(cachedImage.height, equals(testHeight));
      expect(cachedImage.fit, equals(testFit));
    });
  });
}
