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
  formStringToKeepPoint();
  formNumToKeepPoint();
  listCopyValue();
  mapCopy();
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

/// 11. Convert a string of numbers to a number with specified decimal places
void formStringToKeepPoint() {
  final String a = '111.03'.keepFractionDigits(0);
  print(a);

  final String b = '111.03'.keepFractionDigits(1);
  print(b);

  final String c = '111.03'.keepFractionDigits(2);
  print(c);

  final String d = '111.03'.keepFractionDigits(3);
  print(d);

  final String e = '111'.keepFractionDigits(2);
  print(e);

  final String f = '111.034'.keepFractionDigits(2);
  print(f);

  final String f1 = '111.036'.keepFractionDigits(2);
  print(f1);

  final String f2 = '111.036'.keepFractionDigits(2, round: false);
  print(f2);

  final String g = '111.996'.keepFractionDigits(2);
  print(g);

  final String g1 = '111.994'.keepFractionDigits(2);
  print(g1);

  final String h = 'xx23343'.keepFractionDigits(3);
  print(h);
}

/// 12. Convert a string of numbers to a number with specified decimal places
void formNumToKeepPoint() {
  final String a = 111.03.keepFractionDigits(0);
  print(a);

  final String b = 111.03.keepFractionDigits(1);
  print(b);

  final String c = 111.03.keepFractionDigits(2);
  print(c);

  final String d = 111.03.keepFractionDigits(3);
  print(d);

  final String e = 111.keepFractionDigits(2);
  print(e);

  final String f = 111.034.keepFractionDigits(2);
  print(f);

  final String f1 = 111.036.keepFractionDigits(2);
  print(f1);

  final String f2 = 111.036.keepFractionDigits(2, round: false);
  print(f2);

  final String g = 111.996.keepFractionDigits(2);
  print(g);

  final String g1 = 111.994.keepFractionDigits(2);
  print(g1);
}

/// 12. Collection object value copy
void listCopyValue() {
  final List<int> a = <int>[1, 2, 3];
  final List<int> b = a.copy();
  a.add(4);
  print(a); // [1,2,3,4]
  print(b); // [1,2,3]
}

/// 13. Copy the value of the key-value collection
void mapCopy() {
  final Map<String, String> a = <String, String>{'a': '10', 'b': '20'};
  final Map<String, String> b = a;
  final Map<String, String> c = a.copy();
  a['a'] = '00';
  print(a); // {a: 00, b: 20}
  print(b); // {a: 00, b: 20}
  print(c); // {a: 10, b: 20}
}

/// 14. A key-value collection gets a new key-value from another key-value collection
void mapCopyMap() {
  final Map<String, String> a = <String, String>{'a': '10'};
  final Map<String, String> b = <String, String>{
    'a': '00',
    'b': '10',
    'c': '20'
  };
  final Map<String, String> c = a.copyFrom(b);
  print(c); // {a: 10, b: 10, c: 20}
}
