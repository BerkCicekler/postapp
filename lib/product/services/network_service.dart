import 'package:dio/dio.dart';

final class NetworkService {
  NetworkService._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:3000',
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static NetworkService get instance {
    if (_instance == null) {
      _instance = NetworkService._init();
    }
    return _instance!;
  }

  static NetworkService? _instance;

  late final Dio dio;
}
