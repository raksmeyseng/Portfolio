part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState._({
    this.theme = const LightTheme(AppThemeOptions()),
    this.language = AppConstant.defaultLang,
    this.status = BaseStatusEnum.initial,
    this.themeOptions = const AppThemeOptions(
      primaryColorHex: AppColor.primaryHex,
      fontFamily: AppConstant.defaultFont,
    ),
    this.isLoading = false,
  });

  final AppTheme theme;
  final LanguageEnum language;
  final BaseStatusEnum status;
  final bool isLoading;
  final AppThemeOptions themeOptions;

  const AppState.initial() : this._();

  AppState copyWith({
    AppTheme? theme,
    LanguageEnum? language,
    BaseStatusEnum? status,
    AppThemeOptions? themeOptions,
    bool? isLoading,
  }) {
    return AppState._(
      theme: theme ?? this.theme,
      language: language ?? this.language,
      status: status ?? this.status,
      themeOptions: themeOptions ?? this.themeOptions,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        theme,
        language,
        status,
        themeOptions,
        isLoading,
      ];
}
