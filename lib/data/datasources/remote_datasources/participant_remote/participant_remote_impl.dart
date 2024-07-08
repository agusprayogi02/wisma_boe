import 'package:next_starter/common/base/base_dio_remote_source.dart';

import 'participant_remote.dart';

class ParticipantRemoteImpl extends BaseDioRemoteSource implements ParticipantRemote {
  ParticipantRemoteImpl(super.dio, super.session);
}
