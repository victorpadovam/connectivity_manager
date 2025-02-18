import 'package:connectivity_manager/connectivity_manager.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityBar extends StatelessWidget {
  final ConnectivityService connectivityService;

  ConnectivityBar({required this.connectivityService});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: connectivityService.connectivityStream,
      builder: (context, snapshot) {
        // Verifica se o status da conexão mudou
        if (snapshot.connectionState == ConnectionState.active) {
          // Define o estilo da barra com base no status
          Color backgroundColor;
          String message;

          if (snapshot.data == ConnectivityResult.none) {
            backgroundColor = Colors.red;
            message = "Sem conexão com a internet";
          } else if (snapshot.data == ConnectivityResult.wifi) {
            backgroundColor = Colors.green;
            message = "Conectado via Wi-Fi";
          } else if (snapshot.data == ConnectivityResult.mobile) {
            backgroundColor = Colors.orange;
            message = "Conectado via Dados móveis";
          } else {
            backgroundColor = Colors.grey;
            message = "Status de rede desconhecido";
          }

          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8),
            color: backgroundColor,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          );
        }

        // Exibe uma barra de carregamento enquanto espera a resposta do Stream
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 8),
          color: Colors.grey,
          child: Text(
            "Verificando conectividade...",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
