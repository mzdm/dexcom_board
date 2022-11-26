import 'package:dio/dio.dart';
import 'package:fhir/r4.dart' as fhir;

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

  Future<void> uploadPatientValues(String userId, List<String> data) async {
    final observation = fhir.Observation(
      id: userId, //TODO here put the time?
      identifier: [
        fhir.Identifier(
          use: fhir.IdentifierUse.official,
          system: fhir.FhirUri(
            'http://www.bmc.nl/zorgportal/identifiers/observations',
          ),
          value: '6323',
        )
      ],
      code: fhir.CodeableConcept(
        coding: [
          fhir.Coding(
            system: fhir.FhirUri('http://loinc.org'),
            code: fhir.Code('15074-8'),
            display: 'Glucose [Moles/volume] in Blood',
          ),
        ],
      ),
      subject: fhir.Reference(
        reference: userId, //TODO here use reference to the user
      ),
      valueQuantity: fhir.Quantity(
        value: fhir.Decimal(6.3), //TODO here put the value?
        unit: 'mmol/l',
        system: fhir.FhirUri('http://unitsofmeasure.org'),
        code: fhir.Code('mmol/L'),
      ),
    );

    final bundle = fhir.Bundle(
      // type: fhir.Type,
      entry: [
        fhir.BundleEntry(resource: observation),
      ],
    );
  }

  Future<Response> uploadPatientValues2(
    String userId,
    List<String> data,
  ) async {
    final glucoseJson = {
      'resourceType': 'Observation',
      'id': 'f001',
      'text': {
        'status': 'generated',
        'div':
            "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative with Details</b></p><p><b>id</b>: f001</p><p><b>identifier</b>: 6323 (OFFICIAL)</p><p><b>status</b>: final</p><p><b>code</b>: Glucose [Moles/volume] in Blood <span>(Details : {LOINC code '15074-8' = 'Glucose [Moles/volume] in Blood', given as 'Glucose [Moles/volume] in Blood'})</span></p><p><b>subject</b>: <a>P. van de Heuvel</a></p><p><b>effective</b>: 02/04/2013 9:30:10 AM --&gt; (ongoing)</p><p><b>issued</b>: 03/04/2013 3:30:10 PM</p><p><b>performer</b>: <a>A. Langeveld</a></p><p><b>value</b>: 6.3 mmol/l<span> (Details: UCUM code mmol/L = 'mmol/L')</span></p><p><b>interpretation</b>: High <span>(Details : {http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation code 'H' = 'High', given as 'High'})</span></p><h3>ReferenceRanges</h3><table><tr><td>-</td><td><b>Low</b></td><td><b>High</b></td></tr><tr><td>*</td><td>3.1 mmol/l<span> (Details: UCUM code mmol/L = 'mmol/L')</span></td><td>6.2 mmol/l<span> (Details: UCUM code mmol/L = 'mmol/L')</span></td></tr></table></div>"
      },
      'identifier': [
        {
          'use': 'official',
          'system': 'http://www.bmc.nl/zorgportal/identifiers/observations',
          'value': '6323'
        }
      ],
      'status': 'final',
      'code': {
        'coding': [
          {
            'system': 'http://loinc.org',
            'code': '15074-8',
            'display': 'Glucose [Moles/volume] in Blood'
          }
        ]
      },
      'subject': {'reference': 'Patient/f001', 'display': 'P. van de Heuvel'},
      'effectivePeriod': {'start': '2013-04-02T09:30:10+01:00'},
      'issued': '2013-04-03T15:30:10+01:00',
      'performer': [
        {'reference': 'Practitioner/f005', 'display': 'A. Langeveld'}
      ],
      'valueQuantity': {
        'value': 6.3,
        'unit': 'mmol/l',
        'system': 'http://unitsofmeasure.org',
        'code': 'mmol/L'
      },
      'interpretation': [
        {
          'coding': [
            {
              'system':
                  'http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation',
              'code': 'H',
              'display': 'High'
            }
          ]
        }
      ],
      'referenceRange': [
        {
          'low': {
            'value': 3.1,
            'unit': 'mmol/l',
            'system': 'http://unitsofmeasure.org',
            'code': 'mmol/L'
          },
          'high': {
            'value': 6.2,
            'unit': 'mmol/l',
            'system': 'http://unitsofmeasure.org',
            'code': 'mmol/L'
          }
        }
      ],
      'meta': {
        'tag': [
          {
            'system': 'http://terminology.hl7.org/CodeSystem/v3-ActReason',
            'code': 'HTEST',
            'display': 'test health data'
          }
        ]
      }
    };

    final json = {
      'resourceType': 'Bundle',
      'type': 'transaction',
      'entry': [
        {
          'resource': {
            'resourceType': 'Observation',
            'status': 'final',
            'category': [
              {
                'coding': [
                  {
                    'system':
                        'https://terminology.hl7.org/CodeSystem/observation-category',
                    'code': 'laboratory',
                    'display': 'laboratory'
                  }
                ]
              }
            ],
            'code': {
              'coding': [
                {
                  'system': 'https://loinc.org',
                  'code': '1920-8',
                  'display':
                      'Aspartate aminotransferase [Enzymatic activity/volume] in Serum or Plasma'
                }
              ],
              'text':
                  'Aspartate aminotransferase [Enzymatic activity/volume] in Serum or Plasma'
            },
            'effectiveDateTime': '2012-05-10T11:59:49+00:00',
            'issued': '2012-05-10T11:59:49.565000+00:00'
          },
          'request': {'method': 'POST', 'url': 'Observation'}
        }
      ]
    };

    return _dio.post(
      '/',
      queryParameters: {
        'Content-Type': 'application/json',
      },
      data: json,
    );
  }
}
