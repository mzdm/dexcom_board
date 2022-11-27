import 'package:dexcom_share_api/dexcom_models.dart';
import 'package:dio/dio.dart';
import 'package:fhir/r4.dart' hide Uuid;
import 'package:uuid/uuid.dart';

const fhirApiKey = String.fromEnvironment('FHIR_API_KEY');
const fhirApiUrl = 'https://fhir.asdjt1nlrpl4.static-test-account.isccloud.io';

const uuid = Uuid();

class FhirService {
  FhirService();

  final _dio = Dio(
    BaseOptions(
      baseUrl: fhirApiUrl,
      headers: {
        'x-api-key': fhirApiKey,
      },
    ),
  );

  Future<void> createPatient(String birthNumber) async {
    final patient = Patient(id: birthNumber);
    await _dio.post(
      '/Patient',
      data: patient.toJson(),
    );
  }

  Future<void> uploadPatientGlucoseEventRecordsSnapshot(
    List<GlucoseEventRecord> data,
    String birthNumber,
  ) async {
    final observations = data
        .map(
          (e) => e.glucoseValueEu == null
              ? null
              : Observation(
                  id: uuid.v4(),
                  status: Code('final'),
                  code: CodeableConcept(
                    coding: [
                      Coding(
                        system: FhirUri('http://loinc.org'),
                        code: Code('15074-8'),
                        display: 'Glucose [Moles/volume] in Blood',
                      ),
                    ],
                  ),
                  valueQuantity: Quantity(
                    value: Decimal(e.glucoseValueEu),
                    unit: 'mmol/l',
                    system: FhirUri('http://unitsofmeasure.org'),
                    code: Code('mmol/L'),
                  ),
                  effectiveDateTime: e.WT == null ? null : FhirDateTime(e.WT),
                  subject: Reference(reference: 'Patient/$birthNumber'),
                ),
        )
        .whereType<Observation>();

    final bundleEntries = observations.map(
      (e) => BundleEntry(
        resource: e,
        request: BundleRequest(
          method: Code('POST'),
          url: FhirUri('Observation'),
        ),
      ),
    );

    final bundle = Bundle(
      resourceType: R4ResourceType.Bundle,
      type: Code('transaction'),
      entry: bundleEntries.toList(),
    );

    await _dio.post(
      '/',
      data: bundle.toJson(),
    );
  }
}
