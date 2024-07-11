import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:next_starter/data/dto/paginate_dto.dart';
import 'package:next_starter/data/models/pagination_model.dart';
import 'package:next_starter/data/models/participant_model.dart';
import 'package:next_starter/data/repositories/participant_repository.dart';
import 'package:next_starter/injection.dart';

part 'participant_state.dart';

class ParticipantCubit extends Cubit<ParticipantState> {
  ParticipantCubit() : super(ParticipantInitial());
  final ParticipantRepository repo = locator.get();

  void getParticipantList(int page, {String? search}) async {
    emit(ParticipantLoading());
    final params = PaginateDto(
      page: page,
      search: search,
    );
    final response = await repo.getParticipantList(params);
    response.fold(
      (l) => emit(ParticipantError(l.message)),
      (r) => emit(ParticipantLoaded(r)),
    );
  }
}
