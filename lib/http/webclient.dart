import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptor.dart';

const baseUrl = '<ip>:8080';

final headers = {
  'Content-type': 'application/json',
  'password': '1000',
};

final Client client = HttpClientWithInterceptor.build(interceptors: [
  LoggingInterceptor(),
]);
