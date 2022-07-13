class RegularExpression {
  /// TextField Enter Pattern Expression
  static String emailPattern = r"([a-zA-Z0-9_@.])";
  static String passwordPattern = r"[a-zA-Z0-9#!_@$%^&*-]";
  static String alphabetPattern = r"[a-zA-Z]";
  static String alphabetSpacePattern = r"[a-zA-Z ]";
  static String alphabetDigitSpacePattern = r"[a-zA-Z0-9 ]";
  static String alphabetDigitsPattern = r"[a-zA-Z0-9]";
  static String alphabetDigitsSpacePlusPattern = r"[a-zA-Z0-9+ ]";
  static String alphabetDigitsSpecialSymbolPattern = r"[a-zA-Z0-9#&$%_@. ]";
  static String alphabetDigitsDashPattern = r"[a-zA-Z0-9- ]";
  static String addressValidationPattern = r"[a-zA-Z0-9-@#&* ]";
  static String digitsPattern = r"[0-9]";
  static String digitsPatternSpace = r"[0-9 ]";
  static String digitsPatternForwardSlash = r"[0-9/]";
  static String pricePattern = r'^\d+\.?\d*';

  /// Validation Expression Pattern
  static String emailValidationPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String passwordValidPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
}
