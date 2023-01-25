import 'dart:convert';
import 'dart:developer';

import 'package:my_portfolio/config/themes/app_theme.dart';
import 'package:my_portfolio/languages/generated/l10n.dart';
import 'package:my_portfolio/module/app/model/app_theme_options.dart';
import 'package:my_portfolio/shared/enum/language_enum.dart';
import 'package:my_portfolio/utils/services/local_storage_service.dart';

import '../../../constants/app_constant.dart';

class AppRepository {
  Future<bool> saveTheme(String key) {
    return LocalStorageService.instance.saveString(AppConstant.theme, key);
  }

  Future<bool> saveLanguageCode(String languageCode) {
    return LocalStorageService.instance
        .saveString(AppConstant.langage, languageCode);
  }

  Future<AppTheme> getThemeAsync() async {
    final theme =
        await LocalStorageService.instance.getString(AppConstant.theme);
    final options = await getThemeOptions();
    return AppThemeFactory.buildTheme(theme, themeOptions: options);
  }

  Future<LanguageEnum> loadLangAsync() async {
    final code =
        await LocalStorageService.instance.getString(AppConstant.langage);
    var lang = AppConstant.defaultLang;
    try {
      lang = LanguageEnum.values
          .firstWhere((x) => x.getLocale().languageCode == code);
    } catch (e) {
      inspect(e);
    }
    await S.load(lang.getLocale());
    return lang;
  }

  Future<bool> saveThemeOptions(AppThemeOptions options) async {
    return LocalStorageService.instance.saveString(
      AppConstant.themeOptionKey,
      jsonEncode(options.toJson()),
    );
  }

  Future<AppThemeOptions?> getThemeOptions() async {
    final options = await LocalStorageService.instance
        .getString(AppConstant.themeOptionKey);
    if (options == null) return null;
    return AppThemeOptions.fromJson(jsonDecode(options));
  }
}
