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
}
