import 'package:flutter/services.dart';
import 'package:startick/ui/utils/validations/constant_message.dart';

class EmailTextFormatter extends TextInputFormatter {
  EmailTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText =
        ValidationConstant.emailInputRegEx.stringMatch(newValue.text) ?? "";
    return newText == newValue.text ? newValue : oldValue;
  }
}
