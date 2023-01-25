import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:my_portfolio/shared/enum/base_status_enum.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState.initial()) {
    on<DashboardEvent>(_onAppEvent, transformer: sequential());
  }

  Future<void> _onAppEvent(
      DashboardEvent event, Emitter<DashboardState> emit) async {
    if (event is DashboardStarted) {
      return _onDashboardStarted(event, emit);
    }
  }

  Future<void> _onDashboardStarted(
      DashboardStarted event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(status: BaseStatusEnum.success));
  }
}
