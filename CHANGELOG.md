## 0.0.1

- Extend the functions of some classes of flutter.
  - Extension of the string class.
    1. Remove all spaces in the string.
    2. The string is directly converted to int or double.
    3. String directly converted to collection sequence.
    4. Can check whether the string is a legal ID number.
    5. It can be verified whether the string is all Chinese characters.
    6. It is possible to check whether the character string is a legal mobile phone number.
    7. It is possible to check whether the character string is all digits.
    8. You can format the string amount.
  - Extension of the list class.
    1. The elements in the collection can be spliced into strings.
- The extension method of each extension class

  - String

    ```dart
    1. trimAll() -> String
    2. toInt() -> int
    3. toDouble() -> double
    4. toList({int? lengthSplit,Pattern? patternSplit}) -> List<String>
    5. isIDCard() -> bool
    6. isChineseCharacters() -> bool
    7. isPhoneNumber() -> bool
    8. isAllNumber() -> bool
    9. thousands() -> String
    ```

  - List
    ```dart
    1. splicing() -> String
    ```

## 0.0.2

- New method extension.

  - String

    1. Convert a number string to a string with specified decimal places.

  - Num
    1. Convert a number to a string with specified decimal places.

- Extension methods of each new extension class.

  - String

    ```dart
    1. keepFractionDigits(int,{bool}) -> String
    ```

  - Num

    ```dart
    1. keepFractionDigits(int,{bool}) -> String
    ```

## 0.0.3

- New method extension.

  - List
    1. Collection object value copy
  - Map
    1. Copy the value of the key-value collection
    2. A key-value collection gets a new key-value from another key-value collection

- Extension methods of each new extension class.
  - List
    ```dart
    1. copy({bool}) -> List
    ```
  - Map
    ```dart
    1. copy() -> Map
    2. copyFrom() -> Map
    ```
