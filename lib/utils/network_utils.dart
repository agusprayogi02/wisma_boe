import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkUtils {
  late final Alice alice;
  late final Dio dio;
  late final GlobalKey<NavigatorState> navigatorKey;

  NetworkUtils._() {
    navigatorKey = GlobalKey();
    alice = Alice(showShareButton: true, showNotification: true, navigatorKey: navigatorKey);
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        sendTimeout: const Duration(minutes: 3),
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(minutes: 3),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    )..interceptors.add(alice.getDioInterceptor());
  }

  static const String BASE_URL = 'https://above-vulture-monthly.ngrok-free.app/api/';
  static final NetworkUtils instance = NetworkUtils._();
}
