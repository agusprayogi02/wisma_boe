import 'package:next_starter/common/base/base_repository.dart';
import 'package:next_starter/common/typedefs/typedefs.dart';
import 'package:next_starter/data/datasources/remote_datasources/participant_remote/participant_remote.dart';
import 'package:next_starter/data/dto/paginate_dto.dart';
import 'package:next_starter/data/models/participant_model.dart';

class ParticipantRepository extends BaseRepository {
  ParticipantRepository(super.networkInfo, this.remote);

  final ParticipantRemote remote;

  PaginatedResponse<ParticipantModel> getParticipantList(PaginateDto params) {
    return handleNetworkCall(
      call: remote.getParticipantList(params),
      onSuccess: (data) => data,
    );
  }
}
