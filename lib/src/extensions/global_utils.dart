extension IntUtils on int? {
  static int getValue(int? value, {int defaultValue = 0}) {
    if (value != null) {
      return value;
    } else {
      return defaultValue;
    }
  }
}
