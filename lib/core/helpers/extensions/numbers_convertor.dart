extension NumbersConvertor on int {
  String toArabic() {
    if (this <= 9) {
      return arabicNumbers[this];
    }
    return arabicNumbers[0];
  }
}

List<String> arabicNumbers = [
  '٠',
  '١',
  '٢',
  '٣',
  '٤',
  '٥',
  '٦',
  '٧',
  '٨',
  '٩',
];
