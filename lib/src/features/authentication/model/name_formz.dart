import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:myapp/src/localization/localization_utils.dart';
import 'form_error.dart';

class NameFormzInput extends FormzInput<String, FormError> {
  const NameFormzInput.pure([String value = '']) : super.pure(value);
  const NameFormzInput.dirty([String value = '']) : super.dirty(value);

  @override
  FormError? validator(String? value) {
    if ((value ?? '').isEmpty) {
      return FormError.empty;
    }
    return null;
  }

  String? errorOf(BuildContext context) {
    if (isPure) {
      return null;
    }
    switch (error) {
      case FormError.empty:
        return S.of(context).error_fieldRequired;
      default:
        return null;
    }
  }
}
