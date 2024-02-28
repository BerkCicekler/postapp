import 'package:dio/dio.dart';

final class NetworkService {
  NetworkService._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3000',
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

  /// This method will add the given [authToken] to dio's request method's header
  static void setAuthToken({required String authToken}) {
    _instance!.dio.options = _instance!.dio.options.copyWith(
      headers: {
        'token': authToken,
      },
    );
  }

  static NetworkService? _instance;

  late final Dio dio;
}
