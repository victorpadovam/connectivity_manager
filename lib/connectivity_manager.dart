library connectivity_manager;

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  // StreamController para ouvir mudanças de conectividade
  final Connectivity _connectivity = Connectivity();
  final StreamController<ConnectivityResult> _controller =
      StreamController<ConnectivityResult>.broadcast();

  // Stream que outros widgets podem escutar
  Stream<ConnectivityResult> get connectivityStream => _controller.stream;

  // Construtor
  ConnectivityService() {
    // Inicializa a verificação inicial de rede
    _checkConnectivity();

    // Associa o monitoramento de mudanças de rede
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _controller.add(result);
    });
  }

  // Função para verificar a conectividade inicial
  Future<void> _checkConnectivity() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _controller.add(result);
  }

  // Função para fechar o StreamController quando não for mais necessário
  void dispose() {
    _controller.close();
  }
}
