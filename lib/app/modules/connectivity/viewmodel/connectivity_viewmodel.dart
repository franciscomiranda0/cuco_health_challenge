import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity;
  late final StreamSubscription<ConnectivityResult> _subscription;
  late ConnectivityResult _connectivityStatus;

  ConnectivityCubit(this._connectivity)
      : super(const ConnectionLoadInProgress()) {
    _checkConnectivity();
    _subscription =
        _connectivity.onConnectivityChanged.listen(_checkConnectivity);
  }

  Future<void> _checkConnectivity([ConnectivityResult? status]) async {
    try {
      _connectivityStatus = status ?? await _connectivity.checkConnectivity();
      if (_hasNoConnection) {
        emit(const ConnectionFailure());
      } else if (_hasConnection) {
        emit(const ConnectionSuccess());
      }
    } catch (_) {
      emit(const ConnectionError('Não foi possível determinar sua conexão.'));
    }
  }

  bool get _hasNoConnection => !_hasConnection;
  bool get _hasConnection =>
      _connectivityStatus == ConnectivityResult.mobile ||
      _connectivityStatus == ConnectivityResult.wifi;

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
