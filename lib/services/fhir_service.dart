import 'package:dio/dio.dart';

String fhirApiKey = '';
String fhirApiUrl = '';

class FhirService {
  final _dio = Dio(
    BaseOptions(
      baseUrl: fhirApiUrl,
      headers: {
        'x-api-key': fhirApiKey,
      },
    ),
  );
}
