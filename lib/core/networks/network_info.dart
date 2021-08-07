abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  // todo: check network connection stable
  @override
  Future<bool> get isConnected => Future.value(true);
}
