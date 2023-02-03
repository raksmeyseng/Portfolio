import 'package:my_portfolio/shared/enum/language_enum.dart';

class AppConstant {
  static const String appName = "Raksmey Seng";

  // The year that the app is first published
  static const String copyRight = "Copyright © 2022 Raksmey Seng";
  static const String divider = "|";

  // Format Media ID
  static const String guid = '00000000-0000-0000-0000-000000000000';

  static const String defaultFont = "Montserrat";
  static const List<String> primaryFonts = ['Montserrat'];
  static const String secondaryFonts = 'Electrolize';

  // Local storage keys
  /// CAUTION: Change this key value, the app will wipe out all local storage at first run
  static const String wipeKey = "sy5a8iWP";
  static const String dataWipeKey = "wipe-key";

  static const String themeOptionKey = 'theme-options-key';
  static const String theme = "theme";
  static const String langage = "language";

  // Default value
  static const LanguageEnum defaultLang = LanguageEnum.khmer;

  // OTP
  static const int otpTimeoutSeconds = 120;

  // App Environment
  static const String defaultEnvCode = "jbWubxA9";
  static const String developerCode = "2022";

  static const bool skipLogin = false;

  // Date format
  static const String normalDateFormat = 'dd/MM/yyyy';
  static const String monthDateFormat = 'MMM yyyy';
  static const String dateTimeFormat = "dd/MM/yyyy hh:mm a";
  static const String timeFormat = 'hh:mm a';

  // Number format
  static const String decimalFormat = '#,##0.00;-#,##0.00;0.00';
  static const String noneDecimalFormat = '#,##0;-#,##0;0';
}
