import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

class ChopperLogger implements RequestInterceptor, ResponseInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    debugPrint('*** Start :: On Request Log using Chopper ***');
    debugPrint('${request.method} ${request.url}');
    debugPrint('Query Parameter :: ${request.parameters}');
    debugPrint('*** End :: On Request Log using Chopper ***');
    return request;
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    debugPrint('*** Start :: On Response Log using Chopper ***');
    debugPrint('Status Code = ${response.statusCode}');
    debugPrint('Base Url :: ${response.base.request?.url}');
    debugPrint('Body of Data');
    if (response.body != []) {
      debugPrint('${response.body}');
    } else {
      debugPrint('No data found');
    }
    if (response.error != null) {
      debugPrint('Error :: ${response.error}');
    }
    debugPrint('*** End :: On Request Log using Chopper ***');

    return response;
  }
}
