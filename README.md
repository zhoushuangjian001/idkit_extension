# idkit_extension

### Introduction

This package is mainly used to extend common functions of some classes in Flutter development, making it more convenient and simple for developers to develop.

### Functions of currently extended classes

- #### String

  ##### 1. Remove all spaces in the string.

  ```dart
  /// 1. Remove all spaces in the string.
  void removeAllSpaces() {
    const String testStr = ' aa bb  cc dd  ';
    print(testStr.trimAll()); // aabbccdd
  }
  ```

  ##### 2. Convert a string to a number.

  ```dart
  /// 2. Convert a string to a number.
  void toNumber() {
    const String value = '110';
    print(value.toInt()); // 110
    print(value.toDouble()); // 110.0
  }
  ```

  ##### 3. Convert a string to a number.

  ```dart
  /// 3. Convert string to collection.
  void toCollection() {
    const String testStr = 'abcd';
    print(testStr.toList()); // [a,b,c,d]

    const String testStr1 = '1,2,10,21';
    print(testStr1.toList(patternSplit: ',')); // [1,2,10,21]
  }
  ```

  ##### 4. ID card verification.

  ```dart
  /// 4. ID card verification.
  void toID() {
      const String id1 = '53010219200508011X';
      print(id1.isIDCard()); // true

      const String id2 = '53010219200508012X';
      print(id2.isIDCard()); // false
  }
  ```

  ##### 5. Verify that the string is all Chinese characters.

  ```dart
  /// 5. Verify that the string is all Chinese characters.
  void toCC() {
      const String txt1 = '我是who';
      print(txt1.isChineseCharacters()); // false

      const String txt2 = '我是 大鲨鱼，是吗';
      print(txt2.isChineseCharacters()); // true
  }
  ```

  ##### 6. Verify that the string is a qualified phone number.

  ```dart
  /// 6. Verify that the string is a qualified phone number.
  void toPhone() {
      const String phone = '18801210281';
      print(phone.isPhoneNumber()); // true

      const String phone1 = '12801210281';
      print(phone1.isPhoneNumber()); // false
  }
  ```

  ##### 7. Verify whether it is a string composed of 0-9.

  ```dart
  /// 7. Verify whether it is a string composed of 0-9.
  void toVerifyNumber() {
      const String phone = '18801210281';
      print(phone.isAllNumber()); // true

      const String phone1 = '12801210281#';
      print(phone1.isAllNumber()); // false
  }
  ```

  ##### 8. Amount formatted in thousandths.

  ```dart
  /// 8. Amount formatted in thousandths.
  void toAmount() {
      const String amount = '12345';
      print(amount.thousands()); // 12,345

      const String amount1 = '12345.087';
      print(amount1.thousands()); // 12,345.087
  }
  ```

- #### List

  ##### 1. Splicing between collection elements.

  ```dart
  /// 1. Splicing between collection elements.
  void toStringFromList() {
      const List<String> list = <String>['T', 'h', 'i', 's'];
      print(list.splicing()); // This

      const List<String> list1 = <String>['2021', '11', '17'];
      print(list1.splicing('-')); // 2021-11-17
  }
  ```

# - 0.0.3 Update content introduction

#### 1. Add a method to copy the value of the collection object

```dart
void listCopyValue() {
  final List<int> a = <int>[1, 2, 3];
  final List<int> b = a.copy();
  a.add(4);
  print(a); // [1,2,3,4]
  print(b); // [1,2,3]
}
```

#### 2. Copy the value of the key-value collection

```dart
void mapCopy() {
  final Map<String, String> a = <String, String>{'a': '10', 'b': '20'};
  final Map<String, String> b = a;
  final Map<String, String> c = a.copy();
  a['a'] = '00';
  print(a); // {a: 00, b: 20}
  print(b); // {a: 00, b: 20}
  print(c); // {a: 10, b: 20}
}
```

#### 3. A key-value collection gets a new key-value from another key-value collection

```dart
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
```
