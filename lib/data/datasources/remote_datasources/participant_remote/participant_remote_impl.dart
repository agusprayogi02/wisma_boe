import 'package:next_starter/common/base/base_dio_remote_source.dart';
import 'package:next_starter/data/dto/paginate_dto.dart';
import 'package:next_starter/data/models/pagination_model.dart';
import 'package:next_starter/data/models/participant_model.dart';

import 'participant_remote.dart';

class ParticipantRemoteImpl extends BaseDioRemoteSource implements ParticipantRemote {
  ParticipantRemoteImpl(super.dio, super.session);

  @override
  Future<PaginationModel<ParticipantModel>> getParticipantList(PaginateDto params) {
    return networkRequest(
      request: (dio) => dio.get(
        "peserta/search",
        queryParameters: params.toMap(),
      ),
      onResponse: (data) => PaginationModel.fromJson(data, (e) => ParticipantModel.fromJson(e)),
      isPaginate: true,
      isAuth: true,
    );
  }
}
