import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalRange;

  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange > 0);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    // Allow only digits and one decimal point
    String newString = newValue.text;
    if (newString.isNotEmpty &&
        !RegExp(r'^\d*\.?\d*$').hasMatch(newString)) {
      return oldValue;
    }

    if (truncated.contains('.') &&
        truncated.substring(truncated.indexOf('.') + 1).length > decimalRange) {
      truncated = oldValue.text;
      newSelection = oldValue.selection;
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
      composing: TextRange.empty,
    );
  }
}