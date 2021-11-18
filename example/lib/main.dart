import 'package:idkit_extension/idkit_extension.dart';

void main() {
  removeAllSpaces();
  toNumber();
  toCollection();
  toID();
  toCC();
  toPhone();
  toVerifyNumber();
  toAmount();
  toStringFromList();
}

/// 1. Remove all spaces in the string.
void removeAllSpaces() {
  const String testStr = ' aa bb  cc dd  ';
  print(testStr.trimAll());
}

/// 2. Convert a string to a number.
void toNumber() {
  const String value = '110';
  print(value.toInt()); // 110
  print(value.toDouble()); // 110.0
}

/// 3. Convert string to collection.
void toCollection() {
  const String testStr = 'abcd';
  print(testStr.toList()); // [a,b,c,d]

  const String testStr1 = '1,2,10,21';
  print(testStr1.toList(patternSplit: ',')); // [1,2,10,21]
}

/// 4. ID card verification.
void toID() {
  const String id1 = '53010219200508011X';
  print(id1.isIDCard()); // true

  const String id2 = '53010219200508012X';
  print(id2.isIDCard()); // false
}

/// 5. Verify that the string is all Chinese characters.
void toCC() {
  const String txt1 = '我是who';
  print(txt1.isChineseCharacters()); // false

  const String txt2 = '我是 大鲨鱼，是吗';
  print(txt2.isChineseCharacters()); // true
}

/// 6. Verify that the string is a qualified phone number.
void toPhone() {
  const String phone = '18801210281';
  print(phone.isPhoneNumber()); // true

  const String phone1 = '12801210281';
  print(phone1.isPhoneNumber()); // false
}

/// 7. Verify whether it is a string composed of 0-9.
void toVerifyNumber() {
  const String phone = '18801210281';
  print(phone.isAllNumber()); // true

  const String phone1 = '12801210281#';
  print(phone1.isAllNumber()); // false
}

/// 8. Amount formatted in thousandths.
void toAmount() {
  const String amount = '12345';
  print(amount.thousands()); // 12,345

  const String amount1 = '12345.087';
  print(amount1.thousands()); // 12,345.087
}

/// 9. Splicing between collection elements.
void toStringFromList() {
  const List<String> list = <String>['T', 'h', 'i', 's'];
  print(list.splicing()); // This

  const List<String> list1 = <String>['2021', '11', '17'];
  print(list1.splicing('-')); // 2021-11-17
}
