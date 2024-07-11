part of 'participant_cubit.dart';

sealed class ParticipantState extends Equatable {
  const ParticipantState();

  @override
  List<Object> get props => [];
}

final class ParticipantInitial extends ParticipantState {}

final class ParticipantLoading extends ParticipantState {}

final class ParticipantLoaded extends ParticipantState {
  final PaginationModel<ParticipantModel> data;

  const ParticipantLoaded(this.data);

  @override
  List<Object> get props => [data];
}

final class ParticipantError extends ParticipantState {
  final String message;

  const ParticipantError(this.message);

  @override
  List<Object> get props => [message];
}
