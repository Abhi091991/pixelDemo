import 'dart:ui';

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this; // Return the string unchanged if it's empty
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String toTitleCase() {
    // Define a regular expression pattern to match words,
    // including punctuation, but excluding certain patterns like "50/90"
    final RegExp wordPattern = RegExp(r'(?<![0-9/])\b\w+\b');

    return replaceAllMapped(wordPattern, (match) {
      // Capitalize each word
      return match.group(0)!.capitalize();
    });
  }
}

extension HexColor on Color {
  static Color getTextColor(Color color) {
    int d = 0;
    double luminance =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
    d = luminance > 0.5 ? 0 : 255;
    return Color.fromARGB(color.alpha, d, d, d);
  }

  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    var strColor = (hexString == "null" || hexString == "") ? "#00D936" : hexString;
    if (hexString.length == 9) {
      strColor = hexString.replaceRange(7, 9, "");
    }
    if (strColor.length == 6 || strColor.length == 7) buffer.write('ff');
    buffer.write(strColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;
}
