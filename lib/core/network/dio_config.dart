import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:app_valtx_asistencia/core/environment/env.dart';
import 'package:app_valtx_asistencia/core/network/interceptors/logger_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';

class DioConfig {
  static void initialize() async {
    const String fingerprint =
        'cff5fbb0824e8f8a5bc15d194d4e42278fd412054eb002e16c8cafac222ff90a';
    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: Environment.appConfig["baseUrl"],
          connectTimeout: Duration(
            milliseconds: Environment.appConfig["connectTimeout"],
          ),
          receiveTimeout: Duration(
            milliseconds: Environment.appConfig["receiveTimeout"],
          ),
          responseType: ResponseType.json,
        ),
      )
        ..httpClientAdapter = IOHttpClientAdapter(
          createHttpClient: () {
            final HttpClient client =
                HttpClient(context: SecurityContext(withTrustedRoots: false));
            client.badCertificateCallback = (cert, host, port) => true;
            return client;
          },
          validateCertificate: (cert, host, port) {
            if (cert == null) {
              return false;
            }
            return fingerprint == sha256.convert(cert.der).toString();
          },
        )
        ..interceptors.addAll([
          LoggerInterceptor(),
        ]),
      fenix: true,
    );
  }
}
