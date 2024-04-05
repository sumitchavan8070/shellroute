import 'package:flutter/services.dart';

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow the number zero if it follows "1420150"
    if (newValue.text == '0') {
      var previousText = oldValue.text;
      if (previousText == '142015') {
        return newValue;
      }
      return oldValue;
    }
    return newValue;
  }
}

class NumberDotFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String filteredText = newValue.text;
    
    // Remove all characters except numbers and dots
    filteredText = filteredText.replaceAll(RegExp(r'[^0-9.]'), '');
    
    return newValue.copyWith(text: filteredText);
  }
}

class AlphanumericFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String filteredText = newValue.text;

    // Remove all characters except alphanumeric and dots
    filteredText = filteredText.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
    
    return newValue.copyWith(text: filteredText);
  }
}


class OnlyCharactersFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String filteredText = newValue.text;

    // Trim leading spaces
    filteredText = filteredText.trimLeft();

    // If the input is empty, disallow empty space
    if (filteredText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Use a regular expression to remove any non-character characters
    filteredText = filteredText.replaceAll(RegExp(r'[^a-zA-Z\s]'), '');

    return TextEditingValue(
      text: filteredText,
      selection: TextSelection.collapsed(offset: filteredText.length),
    );
  }
}

class EmailAndDomainFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String filteredText = newValue.text;

    // Trim leading spaces
    filteredText = filteredText.trim();

    // If the input is empty, disallow empty space
    if (filteredText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Use a regular expression to remove any non-character characters
   // Check if the new value contains "@" or ".com"
    if (newValue.text.contains('@') || newValue.text.contains('.com')) {
      // Check if the new value contains any space, if yes, remove it
      if (newValue.text.contains(' ')) {
        String filteredText = newValue.text.replaceAll(' ', '');
        return TextEditingValue(
          text: filteredText,
          selection: TextSelection.fromPosition(
            TextPosition(offset: filteredText.length),
          ),
        );
      }
    }

    return TextEditingValue(
      text: filteredText,
      selection: TextSelection.collapsed(offset: filteredText.length),
    );
  }
}
class Edit extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String filteredText = newValue.text;

    // Trim leading spaces
    filteredText = filteredText.trim();

    // If the input is empty, disallow empty space
    if (filteredText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    
    // Check if the new value contains "00", if yes, remove it
    if (newValue.text.contains('00')) {
      filteredText = newValue.text.replaceAll('00', '');
      return TextEditingValue(
        text: filteredText,
        selection: TextSelection.fromPosition(
          TextPosition(offset: filteredText.length),
        ),
      );
    }

    return TextEditingValue(
      text: filteredText,
      selection: TextSelection.collapsed(offset: filteredText.length),
    );
  }
}
