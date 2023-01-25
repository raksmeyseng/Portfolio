import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_portfolio/config/themes/app_color.dart';
import 'package:my_portfolio/config/themes/app_theme.dart';
import 'package:my_portfolio/constants/app_constant.dart';
import 'package:my_portfolio/module/app/model/app_theme_options.dart';
import 'package:my_portfolio/module/app/repositories/app_repository.dart';
import 'package:my_portfolio/shared/enum/base_status_enum.dart';
import 'package:my_portfolio/shared/enum/language_enum.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.appRepo}) : super(const AppState.initial()) {
    on<AppEvent>(_onAppEvent, transformer: sequential());
  }

  final AppRepository appRepo;

  Future<void> _onAppEvent(AppEvent event, Emitter<AppState> emit) async {
    if (event is AppStarted) return _onAppStarted(event, emit);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    try {
      emit(const AppState.initial());

      // ==================
      // Load Theme & Language first
      // ==================
      final theme = await appRepo.getThemeAsync();
      final lang = await appRepo.loadLangAsync();
      final themeOptions = await appRepo.getThemeOptions();
      emit(state.copyWith(
        theme: theme,
        language: lang,
        themeOptions: themeOptions,
        status: BaseStatusEnum.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BaseStatusEnum.failure,
      ));
    }
  }
}
