import 'package:idkit_extension/idkit_extension.dart' show IDKitString;

extension IDKitNum on num {
  /// Convert a number to a string with specified decimal places.
  /// [fractionDigits] : Number of decimal places.
  /// [round] : Carry processing, default true carry , false no carry.
  String keepFractionDigits(int fractionDigits, {bool round = true}) {
    final String value = toString();
    return value.keepFractionDigits(fractionDigits, round: round);
  }
}
