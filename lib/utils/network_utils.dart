import 'package:dio/dio.dart';

class NetworkUtils {
  static const String BASE_URL = 'https://above-vulture-monthly.ngrok-free.app/';

  Dio dio() {
    final dio = Dio(
      BaseOptions(
        // baseUrl: 'https://cuaca-gempa-rest-api.vercel.app/',
        baseUrl: BASE_URL,
        sendTimeout: const Duration(minutes: 3),
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(minutes: 3),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    return dio;
  }
}
