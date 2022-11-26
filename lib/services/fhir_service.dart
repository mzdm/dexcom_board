import 'package:dio/dio.dart';

const fhirApiKey = String.fromEnvironment('FHIR_API_KEY');
String fhirApiUrl = 'https://fhir.asdjt1nlrpl4.static-test-account.isccloud.io';

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
