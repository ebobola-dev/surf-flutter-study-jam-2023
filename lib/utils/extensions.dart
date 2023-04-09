extension NumberExtension on int {
  bool toBoolean() {
    return this == 0 ? false : true;
  }
}

extension BooleanExtension on bool {
  int toInt() {
    return this ? 1 : 0;
  }
}
