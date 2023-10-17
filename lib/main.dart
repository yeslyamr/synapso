import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:synapso/core/network/api_endpoints.dart';
import 'package:synapso/core/network/api_service.dart';
import 'package:synapso/core/network/dio_service.dart';
import 'package:synapso/core/network/interceptors/api_interceptor.dart';
import 'package:synapso/core/network/interceptors/logging_interceptor.dart';
import 'package:synapso/core/utils/key_value_storage_base.dart';
import 'package:synapso/core/utils/key_value_storage_service.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // For preparing the key-value mem cache
  await KeyValueStorageBase.init();

  GetIt.I.registerSingleton<KeyValueStorageService>(KeyValueStorageService());

  final cacheOptions = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.noCache, // Bcz we force cache on-demand in repositories
    maxStale: const Duration(days: 30), // No of days cache is valid
    keyBuilder: (options) => options.path,
  );
  final dioService = DioService(
    dioClient: Dio(
      BaseOptions(
        baseUrl: ApiEndpoint.baseUrl,
      ),
    ),
    interceptors: [
      ApiInterceptor(),
      DioCacheInterceptor(options: cacheOptions),
      if (kDebugMode) LoggingInterceptor(),
    ],
  );

  GetIt.I.registerSingleton<ApiService>(ApiService(dioService));

  runApp(const MyApp());
}
