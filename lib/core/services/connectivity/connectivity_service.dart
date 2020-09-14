import 'package:first_flutter_app/core/enums/connectivity_status.dart';

import '../stoppable_service.dart';

abstract class ConnectivityService implements StoppableService {
  Stream<ConnectivityStatus> get connectivity$;

  Future<bool> get isConnected;
}
