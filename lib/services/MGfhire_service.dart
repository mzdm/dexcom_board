import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:fhir/r4.dart' as fhir;
import 'package:uuid/uuid.dart';

class MGFhirService {
  final _storage = FirebaseStorage.instance;
  final _dio = Dio(
    BaseOptions(
      baseUrl: fhirApiUrl,
      headers: {
        'x-api-key': fhirApiKey,
      },
    ),
  );
  final _appAuth = FlutterAppAuth();

  Future<void> signIn() async {
    final result = await _appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        '2knfqliar2a8btqj9v84kajenb',
        'eu.bindworks.woundsprime://return',
        serviceConfiguration: const AuthorizationServiceConfiguration(
          authorizationEndpoint:
              'https://arrigf9pc6v1.auth.eu-central-1.amazoncognito.com/oauth2/authorize',
          tokenEndpoint:
              'https://arrigf9pc6v1.auth.eu-central-1.amazoncognito.com/oauth2/token',
        ),
        scopes: ['openid', 'profile', 'launch/patient', 'patient/*.*'],
      ),
    );
    print(result);
  }

  Future<String> _uploadMedia(File imageFile) async {
    try {
      final id = const Uuid().v4();
      final media = fhir.Media(
        id: fhir.Id(id),
        status: fhir.Code('completed'),
        content: fhir.Attachment(
          contentType: const fhir.Code.asConst('image/jpeg'),
          url: fhir.FhirUrl(_storage.ref(id).fullPath),
        ),
        subject: fhir.Reference(reference: 'Patient/$loggedInUserId'),
      );

      final response = await _dio.put('/Media/$id', data: media.toJson());
      _storage.ref('$id.jpg').putFile(imageFile);
      print(response);
      return id;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addReport(
    DateTime effectiveDateTime,
    String? note,
    File imageFile,
    ProcessedImageData imageData,
  ) async {
    try {
      final mediaId = await _uploadMedia(imageFile);
      final diagnosticReportId = const Uuid().v4();
      final necrosisObservationId = const Uuid().v4();
      final granulationObservationId = const Uuid().v4();
      final sloughObservationId = const Uuid().v4();

      final areaObservationId = const Uuid().v4();
      final perimeterObservationId = const Uuid().v4();
      final longestDistanceObservationId = const Uuid().v4();

      final necrosis = _createColorObservation(
        necrosisObservationId,
        'necrosis',
        imageData.necrosis.toString(),
      );
      final granulation = _createColorObservation(
        granulationObservationId,
        'granulation',
        imageData.granulation.toString(),
      );
      final slough = _createColorObservation(
        sloughObservationId,
        'slough',
        imageData.slough.toString(),
      );

      final area = _createObservation(
        areaObservationId,
        'area',
        imageData.area.toString(),
        'size',
      );
      final perimeter = _createObservation(
        perimeterObservationId,
        'perimeter',
        imageData.perimeter.toString(),
        'size',
      );
      final longestDistance = _createObservation(
        longestDistanceObservationId,
        'longestDistance',
        imageData.longestDistance.toString(),
        'size',
      );

      final report = fhir.DiagnosticReport(
        id: fhir.Id(diagnosticReportId),
        effectiveDateTime: fhir.FhirDateTime(effectiveDateTime),
        code: fhir.CodeableConcept(
          text: note == null || note.isEmpty ? 'no note' : note,
        ),
        status: fhir.DiagnosticReportStatus.final_,
        subject: fhir.Reference(reference: 'Patient/$loggedInUserId'),
        result: [
          fhir.Reference(reference: 'urn:uuid:$necrosisObservationId'),
          fhir.Reference(reference: 'urn:uuid:$sloughObservationId'),
          fhir.Reference(reference: 'urn:uuid:$granulationObservationId'),
          fhir.Reference(reference: 'urn:uuid:$areaObservationId'),
          fhir.Reference(reference: 'urn:uuid:$perimeterObservationId'),
          fhir.Reference(reference: 'urn:uuid:$longestDistanceObservationId'),
        ],
        media: [
          fhir.DiagnosticReportMedia(
            link: fhir.Reference(reference: 'Media/$mediaId'),
          )
        ],
      );
      final bundle = fhir.Bundle(
        type: fhir.BundleType.transaction,
        entry: [
          bundleEntryFromObservation(necrosisObservationId, necrosis),
          bundleEntryFromObservation(sloughObservationId, slough),
          bundleEntryFromObservation(granulationObservationId, granulation),
          bundleEntryFromObservation(areaObservationId, area),
          bundleEntryFromObservation(perimeterObservationId, perimeter),
          bundleEntryFromObservation(
            longestDistanceObservationId,
            longestDistance,
          ),
          fhir.BundleEntry(
            fullUrl: fhir.FhirUri('urn:uuid:$diagnosticReportId'),
            resource: report,
            request: fhir.BundleRequest(
              url: fhir.FhirUri('DiagnosticReport'),
              method: fhir.BundleRequestMethod.post,
            ),
          ),
        ],
      );
      final response = await _dio.post('/', data: bundle.toJson());
      print(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<fhir.Observation>> getObservations(
    String diagnosticReportId,
  ) async {
    final response = await _dio.get(
      '/Observation',
      queryParameters: {'_has:DiagnosticReport:result:_id': diagnosticReportId},
    );
    final data = jsonDecode(response.data);
    if (data == null) return [];
    return ((jsonDecode(response.data) as Map)['entry'] as List)
        .map((e) => fhir.Observation.fromJson(e['resource']))
        .toList();
  }

  Future<List<DiagnosticReportWithObservations>> getReports(
    List<DiagnosticReportWithObservations> currentState,
  ) async {
    try {
      final response = await _dio.get(
        '/DiagnosticReport',
        queryParameters: {'patient': loggedInUserId},
      );
      final reports = fhir.Bundle.fromJson(jsonDecode(response.data))
              .entry
              ?.map((e) => e.resource as fhir.DiagnosticReport)
              .toList() ??
          [];
      return (await Future.wait(
        reports.map((r) async {
          if (r.result == null || r.result!.isEmpty || r.id?.value == null) {
            return DiagnosticReportWithObservations(r, []);
          }
          final storedReport =
              currentState.firstWhereOrNull((e) => e.report.id == r.id);
          if (storedReport != null) {
            return storedReport;
          } else {
            return DiagnosticReportWithObservations(
              r,
              await getObservations(r.id!.value!),
            );
          }
        }),
      ))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAllReports() async {
    final response = await _dio
        .get('/DiagnosticReport', queryParameters: {'patient': loggedInUserId});
    final reports = fhir.Bundle.fromJson(jsonDecode(response.data))
            .entry
            ?.map((e) => e.resource as fhir.DiagnosticReport)
            .toList() ??
        [];
    for (final report in reports) {
      await _dio.delete('/DiagnosticReport/${report.id}');
    }
  }

  Future<fhir.Observation> getObservation(String reference) async {
    try {
      print('getting observation with ref $reference');
      final response = await _dio.get('/$reference');
      return fhir.Observation.fromJson(jsonDecode(response.data));
    } catch (e) {
      rethrow;
    }
  }

  // not used for now
  Future<fhir.DiagnosticReport> getReport(String id) async {
    try {
      final response = await _dio.get('/DiagnosticReport/$id');
      return fhir.DiagnosticReport.fromJson(jsonDecode(response.data));
    } catch (e) {
      rethrow;
    }
  }

  // not used for now
  Future<List<fhir.Patient>> getPatients() async {
    try {
      final response = await _dio.get('/Patient');
      return fhir.Bundle.fromJson(jsonDecode(response.data))
              .entry
              ?.map((e) => e.resource as fhir.Patient)
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  fhir.Observation _createColorObservation(
    String id,
    String name,
    String value,
  ) =>
      _createObservation(id, name, value, 'color');

  fhir.Observation _createObservation(
    String id,
    String name,
    String value,
    String title,
  ) =>
      fhir.Observation(
        status: fhir.ObservationStatus.final_,
        id: fhir.Id(id),
        code: fhir.CodeableConcept(
          id: '$title-analysis-$name',
          text: '$title analysis $name',
        ),
        valueString: value,
      );

  fhir.BundleEntry bundleEntryFromObservation(
    String id,
    fhir.Observation observation,
  ) =>
      fhir.BundleEntry(
        fullUrl: fhir.FhirUri('urn:uuid:$id'),
        resource: observation,
        request: fhir.BundleRequest(
          url: fhir.FhirUri('Observation'),
          method: fhir.BundleRequestMethod.post,
        ),
      );
}
