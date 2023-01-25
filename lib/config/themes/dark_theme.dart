import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/config/themes/app_color.dart';
import 'package:my_portfolio/constants/app_constant.dart';
import 'package:my_portfolio/module/app/model/app_theme_options.dart';
import 'package:my_portfolio/utils/helper/js/color_helper.dart';

ThemeData darkTheme(AppThemeOptions? themeOptions) {
  Color primary = AppColor.primary;
  String font = AppConstant.defaultFont;
  if (themeOptions != null) {
    if (themeOptions.primaryColorHex != null) {
      primary = Color(ColorHelper.fromHexString(themeOptions.primaryColorHex!));
    }
    if (themeOptions.fontFamily != null) {
      font = themeOptions.fontFamily!;
    }
  }

  return ThemeData(
    //==================================
    // Color Section
    //==================================
    backgroundColor: AppColor.backgroundDark,
    scaffoldBackgroundColor: AppColor.backgroundDark,
    primaryColor: primary,
    errorColor: AppColor.danger,
    secondaryHeaderColor: primary.withOpacity(0.7),
    dividerColor: AppColor.dividerDark,
    cardColor: AppColor.cardDark,
    bottomAppBarColor: AppColor.bottomAppBarDark,
    unselectedWidgetColor: Colors.grey,
    colorScheme: ColorScheme(
      primary: primary,
      secondary: AppColor.card,
      brightness: Brightness.dark,
      background: AppColor.background,
      error: AppColor.danger,
      onBackground: const Color(0xffB5BFD3),
      onError: AppColor.danger,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      surface: AppColor.primary,
    ),

    //==================================
    // Animate Navigate
    //==================================
    pageTransitionsTheme: kIsWeb
        ? const PageTransitionsTheme(builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          })
        : null,

    //==================================
    // Brightness
    //==================================
    brightness: Brightness.dark,

    //==================================
    // Font-Family
    //==================================
    fontFamily: font,

    timePickerTheme: TimePickerThemeData(
      backgroundColor: primary,
      dialBackgroundColor: primary,
    ),

    //==================================
    // Component Theming
    //==================================
    primaryIconTheme: IconThemeData(color: primary),
    buttonTheme: const ButtonThemeData(buttonColor: AppColor.buttonLight),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(primary),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        side: BorderSide(
          color: primary.withOpacity(.5),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
    iconTheme: const IconThemeData(color: AppColor.white),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: AppColor.white.withOpacity(.7),
      labelColor: primary,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      // scrolledUnderElevation: .5,
      titleSpacing: 16,
      color: AppColor.backgroundDark,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: primary,
        fontSize: 16,
      ),
      iconTheme: IconThemeData(color: primary, size: 20),
      actionsIconTheme: IconThemeData(color: primary, size: 20),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColor.cardDark,
    ),
    dialogBackgroundColor: AppColor.cardDark,
    dialogTheme: const DialogTheme(
      backgroundColor: AppColor.cardDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontWeight: FontWeight.normal),
      prefixStyle: TextStyle(
        color: AppColor.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(primary),
    ),
    textTheme:
        Typography.material2018(platform: defaultTargetPlatform).black.copyWith(
              bodyText1: const TextStyle(color: Colors.white, fontSize: 14),
              bodyText2: const TextStyle(color: AppColor.white, fontSize: 14),
              caption: const TextStyle(color: Colors.white60, fontSize: 14),
              // headline1: const TextStyle(color: AppColor.white, fontSize: 96),
              // headline2: const TextStyle(color: AppColor.white, fontSize: 60),
              subtitle1: const TextStyle(
                color: AppColor.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              subtitle2: const TextStyle(
                color: AppColor.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              overline: const TextStyle(color: AppColor.white, fontSize: 10),
              button: const TextStyle(color: AppColor.white, fontSize: 14),
            ),
    //==================================
    // Others
    //==================================
    visualDensity: VisualDensity.adaptivePlatformDensity,
    platform: defaultTargetPlatform,
  );
}
