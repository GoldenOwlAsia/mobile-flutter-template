import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:myapp/preview/helper/helper.dart';
import 'package:myapp/widgets/forms/input.dart';

@Preview(
  name: 'Preview Input',
  group: PreviewGroups.forms,
  wrapper: commonScaffoldWrapper,
)
Widget previewInput() {
  return Column(
    spacing: 16,
    children: [
      XInput(
        value: '',
        decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
        ),
        onChanged: (value) {},
      ),
      XInput(
        value: 'password123',
        obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
        ),
        onChanged: (value) {},
      ),
      XInput(
        value: '',
        decoration: const InputDecoration(
          labelText: 'Search',
          hintText: 'Type to search',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {},
      ),
      XInput(
        value: '',
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          hintText: 'Enter phone number',
          prefixIcon: Icon(Icons.phone),
        ),
        onChanged: (value) {},
      ),
    ],
  );
}
