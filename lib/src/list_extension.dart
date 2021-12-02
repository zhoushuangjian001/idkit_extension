extension IDKitList<E> on List<E> {
  /// Splicing between collection elements.
  /// [separator] Separator between elements.
  String splicing([String separator = '']) {
    late final StringBuffer buffer = StringBuffer();
    if (isNotEmpty) {
      if (length == 1) {
        buffer.write(first);
      } else {
        buffer.writeAll(this, separator);
      }
    }
    return buffer.toString();
  }

  /// Copy the value of the object.
  /// [growable] Can the generated collection be variable.
  ///
  /// The method is to solve the following problems:
  /// ```dart
  /// List<int> a = <int>[1,2,3];
  /// List<int> b = a;
  /// a.add(4);
  /// print(a); // [1,2,3,4]
  /// print(b); // [1,2,3,4]
  /// ```
  List<E> copy({bool growable = true}) {
    return List<E>.from(this, growable: growable);
  }
}
