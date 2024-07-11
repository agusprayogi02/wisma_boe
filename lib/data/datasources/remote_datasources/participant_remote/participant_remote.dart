import 'package:next_starter/data/dto/paginate_dto.dart';
import 'package:next_starter/data/models/pagination_model.dart';
import 'package:next_starter/data/models/participant_model.dart';

abstract class ParticipantRemote {
  Future<PaginationModel<ParticipantModel>> getParticipantList(PaginateDto params);
}
