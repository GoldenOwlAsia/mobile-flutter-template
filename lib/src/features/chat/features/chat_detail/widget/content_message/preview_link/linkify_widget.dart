import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:linkify/linkify.dart';

export 'package:linkify/linkify.dart'
    show
        EmailElement,
        EmailLinkifier,
        LinkableElement,
        Linkifier,
        LinkifyElement,
        LinkifyOptions,
        TextElement,
        UrlElement,
        UrlLinkifier;

typedef LinkCallback = void Function(LinkableElement link);

class LinkifyWidget extends StatelessWidget {
  const LinkifyWidget({
    Key? key,
    required this.text,
    this.linkifiers = defaultLinkifiers,
    this.onOpen,
    this.options = const LinkifyOptions(),
    this.color,
  }) : super(key: key);
  final String text;
  final List<Linkifier> linkifiers;
  final LinkCallback? onOpen;
  final LinkifyOptions options;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final elements = linkify(
      text,
      options: options,
      linkifiers: linkifiers,
    );

    return Text.rich(
      textAlign: TextAlign.start,
      buildTextSpan(
        elements,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: color ?? Colors.black),
        onOpen: onOpen,
        useMouseRegion: true,
        linkStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class LinkableSpan extends WidgetSpan {
  LinkableSpan({
    required MouseCursor mouseCursor,
    required InlineSpan inlineSpan,
  }) : super(
          child: MouseRegion(
            cursor: mouseCursor,
            child: Text.rich(
              inlineSpan,
            ),
          ),
        );
}

/// Raw TextSpan builder for more control on the RichText
TextSpan buildTextSpan(
  List<LinkifyElement> elements, {
  TextStyle? style,
  TextStyle? linkStyle,
  LinkCallback? onOpen,
  bool useMouseRegion = false,
}) {
  return TextSpan(
    children: elements.map<InlineSpan>(
      (element) {
        if (element is LinkableElement) {
          if (useMouseRegion) {
            return LinkableSpan(
              mouseCursor: SystemMouseCursors.click,
              inlineSpan: TextSpan(
                text: element.text,
                style: linkStyle,
                recognizer: onOpen != null
                    ? (TapGestureRecognizer()..onTap = () => onOpen(element))
                    : null,
              ),
            );
          } else {
            return TextSpan(
              text: element.text,
              style: linkStyle,
              recognizer: onOpen != null
                  ? (TapGestureRecognizer()..onTap = () => onOpen(element))
                  : null,
            );
          }
        } else {
          return TextSpan(
            text: element.text,
            style: style,
          );
        }
      },
    ).toList(),
  );
}
