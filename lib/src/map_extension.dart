extension IDKitMap<K, V> on Map<K, V> {
  /// Copy the value of the key-value collection.
  Map<K, V> copy() {
    return Map<K, V>.from(this);
  }

  /// Convenient to get new key value from key value collection.
  /// [map] The collection of new keys to be obtained.
  Map<K, V> copyFrom(Map<K, V> map) {
    if (isEmpty) {
      return map;
    }
    if (map.isNotEmpty) {
      final Iterable<K> keys = map.keys;
      for (final K item in keys) {
        final V? itemValue = map[item];
        putIfAbsent(item, () => itemValue!);
      }
    }
    return this;
  }
}
