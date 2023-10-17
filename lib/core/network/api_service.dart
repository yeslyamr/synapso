import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:synapso/core/network/custom_exceptions.dart';

// Services
import './api_interface.dart';
import './dio_service.dart';

// Models
import 'response_model.dart';

/// A service class implementing methods for basic API requests.
class ApiService implements ApiInterface {
  /// An instance of [DioService] for network requests
  late final DioService _dioService;

  /// A public constructor that is used to initialize the API service
  /// and setup the underlying [_dioService].
  ApiService(DioService dioService) : _dioService = dioService;

  /// An implementation of the base method for requesting collection of data
  /// from the [endpoint].
  /// The response body must be a [List], else the [parser] fails.
  ///
  /// The [parser] callback is used to **deserialize** the response body
  /// into a [List] of objects of type [T].
  /// The callback is executed on each member of the response `body` List.
  /// [T] is usually set to a `Model`.
  ///
  /// [queryParams] holds any query parameters for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAuthToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an [ApiInterceptor].
  /// The default value is `true`.
  @override
  Future<List<T>> getCollectionData<T>({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    CancelToken? cancelToken,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    bool requiresAuthToken = true,
    required T Function(Map<String, dynamic> responseBody) parser,
  }) async {
    List<Object?> body;

    try {
      // Entire map of response
      final data = await _dioService.get<List<Object?>>(
        endpoint: endpoint,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale: cacheAgeDays != null ? Nullable(Duration(days: cacheAgeDays)) : null,
        ),
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        queryParams: queryParams,
        cancelToken: cancelToken,
      );

      // Items of table as Map<String, dynamic>
      body = data.body;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the deserialized objects
      return body.map((dataMap) => parser(dataMap! as Map<String, dynamic>)).toList();
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  /// An implementation of the base method for requesting a document of data
  /// from the [endpoint].
  /// The response body must be a [Map], else the [parser] fails.
  ///
  /// The [parser] callback is used to **deserialize** the response body
  /// into an object of type [T].
  /// The callback is executed on the response `body`.
  /// [T] is usually set to a `Model`.
  ///
  /// [queryParams] holds any query parameters for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAuthToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an [ApiInterceptor].
  /// The default value is `true`.
  @override
  Future<T> getDocumentData<T>({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    CancelToken? cancelToken,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    bool requiresAuthToken = true,
    required T Function(Map<String, dynamic> response) parser,
  }) async {
    Map<String, dynamic> body;
    try {
      // Entire map of response
      final data = await _dioService.get<Map<String, dynamic>>(
        endpoint: endpoint,
        queryParams: queryParams,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale: cacheAgeDays != null ? Nullable(Duration(days: cacheAgeDays)) : null,
        ),
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );

      body = data.body;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the deserialized object
      return parser(body);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  /// An implementation of the base method for inserting [data] at
  /// the [endpoint].
  /// The response body must be a [Map], else the [parser] fails.
  ///
  /// The [data] contains body for the request.
  ///
  /// The [parser] callback is used to **deserialize** the [ResponseModel]
  /// into an object of type [T].
  /// The callback is executed on the response.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAuthToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an [ApiInterceptor].
  /// The default value is `true`.
  @override
  Future<T> postData<T>({
    required String endpoint,
    required Map<String, dynamic> data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(ResponseModel<Map<String, dynamic>> response) parser,
  }) async {
    ResponseModel<Map<String, dynamic>> response;

    try {
      // Entire map of response
      response = await _dioService.post<Map<String, dynamic>>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the serialized object
      return parser(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  /// An implementation of the base method for updating [data]
  /// at the [endpoint].
  /// The response body must be a [Map], else the [parser] fails.
  ///
  /// The [data] contains body for the request.
  ///
  /// The [parser] callback is used to **deserialize** the [ResponseModel]
  /// into an object of type [T].
  /// The callback is executed on the response.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAuthToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an [ApiInterceptor].
  /// The default value is `true`.
  @override
  Future<T> updateData<T>({
    required String endpoint,
    required Map<String, dynamic> data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(ResponseModel<Map<String, dynamic>> response) parser,
  }) async {
    ResponseModel<Map<String, dynamic>> response;

    try {
      // Entire map of response
      response = await _dioService.patch<Map<String, dynamic>>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the serialized object
      return parser(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  /// An implementation of the base method for deleting [data]
  /// at the [endpoint].
  /// The response body must be a [Map], else the [parser] fails.
  ///
  /// The [data] contains body for the request.
  ///
  /// The [parser] callback is used to **deserialize** the [ResponseModel]
  /// into an object of type [T].
  /// The callback is executed on the response.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [requiresAuthToken] is used to decide if a token will be inserted
  /// in the **headers** of the request using an [ApiInterceptor].
  /// The default value is `true`.
  @override
  Future<T> deleteData<T>({
    required String endpoint,
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(ResponseModel<Map<String, dynamic>> response) parser,
  }) async {
    ResponseModel<Map<String, dynamic>> response;

    try {
      // Entire map of response
      response = await _dioService.delete<Map<String, dynamic>>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{
            'requiresAuthToken': requiresAuthToken,
          },
        ),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the serialized object
      return parser(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  /// An implementation of the base method for cancelling
  /// requests pre-maturely using the [cancelToken].
  ///
  /// If null, the **default** [cancelToken] inside [DioService] is used.
  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }
}
