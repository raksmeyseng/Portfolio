part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState._({
    this.status = BaseStatusEnum.initial,
  });
  final BaseStatusEnum status;
  const DashboardState.initial() : this._();

  DashboardState copyWith({
    BaseStatusEnum? status,
  }) {
    return DashboardState._(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
