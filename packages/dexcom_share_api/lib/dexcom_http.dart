import 'package:dexcom_share_api/dexcom_constants.dart';
import 'package:dexcom_share_api/dexcom_models.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

final dioOptions = Dio(
  BaseOptions(
    baseUrl: DEXCOM_BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ),
);

class DexcomUserApi {
  DexcomUserApi({
    List<Interceptor>? interceptors,
  }) {
    dio = dioOptions;
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }
  }

  late final Dio dio;
  late final String username;
  late final String password;

  String? sessionId;
  String? accountId;

  Future<Either<DioError, void>> init({
    required String username,
    required String password,
  }) async {
    this.username = username;
    this.password = password;
    return _createSession();
  }

  Future<Either<DioError, void>> _createSession() async {
    print('DEBUG_LOG: Creating session for user "$username"');
    final String? accountId;
    try {
      final response = await dio.post(
        '${dioOptions.options.baseUrl}/$DEXCOM_AUTHENTICATE_ENDPOINT',
        data: {
          'accountName': username,
          'password': password,
          'applicationId': DEXCOM_APPLICATION_ID,
        },
      );
      accountId = response.data as String;
    } on DioError catch (e) {
      print('${e.message}: ${e.response.toString()}\n${e.toString()}');
      return Left(e);
    }

    print('accountId: $accountId');
    final String? sessionId;
    try {
      final response2 = await dio.post(
        '${dioOptions.options.baseUrl}/$DEXCOM_LOGIN_ID_ENDPOINT',
        data: {
          'accountId': accountId,
          'password': password,
          'applicationId': DEXCOM_APPLICATION_ID,
        },
      );
      sessionId = response2.data as String;
    } on DioError catch (e) {
      print('DEBUG_LOG: ${e.message}: ${e.response.toString()}\n${e.toString()}');
      return Left(e);
    }

    this.accountId = accountId;
    this.sessionId = sessionId;
    return const Right(null);
  }

  Future<Either<DioError, List<GlucoseEventRecord>>> getGlucoseEventRecords({
    int minutes = 1440,
    int maxCount = 288,
  }) async {
    Future<Response> getGlucoseEventRecords() async => dio.post(
          '${dioOptions.options.baseUrl}/$DEXCOM_GLUCOSE_READINGS_ENDPOINT',
          queryParameters: ReadOptions(
            sessionId: sessionId,
            minutes: minutes,
            maxCount: maxCount,
          ).toJson(),
        );

    final records = <GlucoseEventRecord>[];
    try {
      final response = await getGlucoseEventRecords();
      final jsonGlucoseEventRecords = response.data as List;
      for (final jsonGlucoseEventRecord in jsonGlucoseEventRecords) {
        records.add(GlucoseEventRecord.fromJson(jsonGlucoseEventRecord as Map<String, dynamic>));
      }
    } on DioError catch (e) {
      print('DEBUG_LOG: ${e.message}: ${e.response.toString()}\n${e.toString()}');
      await _createSession();
      final response = await getGlucoseEventRecords();
      if (response.data == null) {
        return Left(e);
      }
      final jsonGlucoseEventRecords = response.data as List;
      for (final jsonGlucoseEventRecord in jsonGlucoseEventRecords) {
        records.add(GlucoseEventRecord.fromJson(jsonGlucoseEventRecord as Map<String, dynamic>));
      }
    }
    print('DEBUG_LOG: Succesfully retrieved glucose event records');
    return Right(records);
  }
}
