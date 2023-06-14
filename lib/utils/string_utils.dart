class StringUtils {
  bool stringMatch(String string1, String string2) {
    final lowerCaseStr1 = string1
        .toLowerCase()
        .replaceAll(' ', '')
        .replaceAll('_', '')
        .replaceAll('*', '');
    final lowerCaseStr2 = string2
        .toLowerCase()
        .replaceAll(' ', '')
        .replaceAll('_', '')
        .replaceAll('*', '');
    return lowerCaseStr1 == lowerCaseStr2;
  }
}
