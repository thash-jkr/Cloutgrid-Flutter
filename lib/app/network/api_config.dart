enum ApiConfig {
  development(
    baseUrl: 'http://192.168.0.232:8000',
    socketUrl: 'ws://192.168.0.232:8000/ws',
  ),
  production(
    baseUrl: 'https://api.cloutgrid.com',
    socketUrl: 'wss://api.cloutgrid.com/ws',
  );

  final String baseUrl;
  final String socketUrl;

  const ApiConfig({required this.baseUrl, required this.socketUrl});

  static const ApiConfig current = ApiConfig.development;
}
