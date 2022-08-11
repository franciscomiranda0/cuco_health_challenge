part of 'connectivity_viewmodel.dart';

@immutable
abstract class ConnectivityState {
  const ConnectivityState();
}

class ConnectionLoadInProgress extends ConnectivityState {
  const ConnectionLoadInProgress();
}

class ConnectionSuccess extends ConnectivityState {
  const ConnectionSuccess();
}

class ConnectionFailure extends ConnectivityState {
  const ConnectionFailure();
}

class ConnectionError extends ConnectivityState {
  final String message;

  const ConnectionError(this.message);
}
