import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 120,
      colors: false,
      printEmojis: true,
      printTime: false,
    ),
  );

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    logger.e('ERROR');
    logger.e('${options.method} request => ${options.baseUrl}${options.path}');
    logger.d('Error: ${err.error}, Message: ${err.message}');
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.v('REQUEST');
    logger.i(
      '${options.method} => ${options.baseUrl}${options.path} \nbody => ${options.data}\nqueryParameters => ${options.queryParameters}',
    );
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.v('RESPONSE');
    logger.d(
      'StatusCode [${response.statusCode}]\nstatusMessage: ${response.statusMessage}\nData: ${json.encode(response.data)}',
    );
    return super.onResponse(response, handler);
  }
}
