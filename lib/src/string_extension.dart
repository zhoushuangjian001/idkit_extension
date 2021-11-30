import 'package:idkit_extension/src/list_extension.dart';

/// Extend the string class.
extension IDKitString on String {
  /// Remove all spaces in the string.
  String trimAll() => replaceAll(RegExp(r'\s+'), '');

  /// String to numeric value.
  int toInt() => int.tryParse(this) ?? 0;
  double toDouble() => double.tryParse(this) ?? 0.0;

  /// Convert string to collection.
  /// [lengthSplit]  Split string by length.
  /// [patternSplit] Split the string according to the specified pattern.
  /// Note: [lengthSplit] has higher priority than [patternSplit].
  List<String> toList({
    int? lengthSplit,
    Pattern? patternSplit,
  }) {
    late List<String> resultList = <String>[];
    if (lengthSplit != null) {
      final int length = this.length;
      if (lengthSplit == 0 || length < lengthSplit) {
        resultList = <String>[this];
      } else {
        final int remainder = length % lengthSplit;
        final int count = length ~/ lengthSplit;
        resultList = List<String>.generate(count, (int i) {
          final int start = i * lengthSplit;
          return substring(start, start + lengthSplit);
        }).toList();
        if (remainder != 0) {
          resultList.add(substring(length - remainder));
        }
      }
    } else {
      resultList = split(patternSplit ?? '');
    }
    return resultList;
  }

  /// ID card verification.
  ///
  /// Note: Hong Kong, Macau, and Taiwan ID card verification is not currently supported.
  bool isIDCard() {
    late bool result = false;
    if (isNotEmpty) {
      final RegExp regExp = RegExp(r'\d{17}[0-9Xx]$');
      if (regExp.hasMatch(this)) {
        final String forward17 = substring(0, 17);
        final String behind1 = substring(17).toUpperCase();
        final List<String> splitList = forward17.toList();
        // Coefficient for id.
        final List<String> modulusList =
            '7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2'.toList(patternSplit: ',');
        late int sum = 0;
        for (int i = 0; i < 17; i++) {
          final int item1 = int.parse(splitList[i]);
          final int item2 = int.parse(modulusList[i]);
          sum += item1 * item2;
        }
        final int remainder = sum % 11;
        late final Map<String, String> mapping = <String, String>{
          '0': '1',
          '1': '0',
          '2': 'X',
          '3': '9',
          '4': '8',
          '5': '7',
          '6': '6',
          '7': '5',
          '8': '4',
          '9': '3',
          '10': '2'
        };
        result = mapping[remainder.toString()] == behind1;
      }
    }
    return result;
  }

  /// Verify that the string is all Chinese characters.
  bool isChineseCharacters() => RegExp(r'[\u4e00-\u9fa5]+$').hasMatch(this);

  /// Verify that the string is a qualified phone number.
  /// Note: Except for IoT cards and data cards.
  bool isPhoneNumber() => RegExp(
          r'^((13[^4]|14[5|7|9]|15[^4]|166|17[^0149]|18\d|19[^4])\d{8}|134[^9]\d{7})$')
      .hasMatch(this);

  /// Verify whether it is a string composed of 0-9.
  bool isAllNumber() => RegExp(r'\d+$').hasMatch(this);

  /// Amount formatted in thousandths.
  String thousands() {
    late String result = this;
    if (length != 0) {
      late String forward = this;
      late String behind = '';
      if (forward.contains('.')) {
        final List<String> splitList = result.split(r'.');
        forward = splitList.first;
        if (splitList.length >= 2) {
          behind = splitList.last;
        }
      }
      final int forwardLength = forward.length;
      final int remainder = forwardLength % 3;
      late List<String> forwardList = <String>[];
      if (remainder != 0) {
        forward = '0' * (3 - remainder) + forward;
      }
      forwardList = forward.toList(lengthSplit: 3);
      final int firstValue = forwardList.first.toInt();
      forwardList.replaceRange(0, 1, <String>[firstValue.toString()]);
      result = forwardList.splicing(',');
      if (behind.isNotEmpty) {
        result += '.' + behind;
      }
    }
    return result;
  }

  /// Convert a number string to a string with specified decimal places.
  /// [fractionDigits] : Number of decimal places.
  /// [round] : Carry processing, default true carry , false no carry.
  String keepFractionDigits(int fractionDigits, {bool round = true}) {
    late String result = this;
    final bool regular = double.tryParse(this) == null;
    if (regular) {
      // 不合法
      if (fractionDigits != null && fractionDigits != 0) {
        result = '0.' + '0' * fractionDigits;
      } else {
        result = '0';
      }
    } else {
      final bool point = contains(RegExp(r'\.'));
      if (point) {
        final List<String> list = split(RegExp(r'\.'));
        late final String firstPart = list.first;
        late final String lastPart = list.last;
        if (round) {
          // 进位处理
          final double value = double.parse(this);
          result = value.toStringAsFixed(fractionDigits);
        } else {
          // 不进位
          result = firstPart + '.' + lastPart.substring(0, fractionDigits);
        }
      } else {
        // 不含小数
        if (fractionDigits != 0) {
          result += '.' + '0' * fractionDigits;
        }
      }
    }
    return result;
  }
}
