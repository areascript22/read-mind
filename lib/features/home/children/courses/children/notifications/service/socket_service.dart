import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  IO.Socket? _socket;

  void connect(int userId, Function() onNewNotification) {
    disconnect();
    try {
      if (_socket != null && _socket!.connected) return;

      _socket = IO.io(
        'http://192.168.0.107:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect() // 🔥 auto-conecta
            .setQuery({'userId': userId.toString()})
            .build(),
      );

      _socket!.onConnect((_) {
        print('🔌 Socket conectado');
        _socket!.emit('user_connected', userId);
      });

      _socket!.on('new_notification', (data) {
        onNewNotification();
      });
    } catch (e) {
      print('❌ Error conectando socket: $e');
    }
  }

  void disconnect() {
    _socket?.disconnect();
    _socket?.clearListeners();
  }
}
