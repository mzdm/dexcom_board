import 'package:dio/dio.dart';

const fhirApiKey = String.fromEnvironment('FHIR_API_KEY');
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
