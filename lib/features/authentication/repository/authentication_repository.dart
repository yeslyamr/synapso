import 'package:get_it/get_it.dart';
import 'package:synapso/core/network/api_endpoints.dart';
import 'package:synapso/core/network/api_service.dart';

class AuthenticationRepository {
  final ApiService _apiService = GetIt.I<ApiService>();

  Future<void> logInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _apiService.postData(
        endpoint: ApiEndpoint.auth(AuthEndpoint.LOGIN),
        data: {
          "email": email,
          "password": password,
          "role": "subject",
        },
        parser: (_) {},
        requiresAuthToken: false,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp({
    required String name,
    required String surname,
    required String mobileNumber,
    required String gender,
    required String dateOfBirth,
    required String email,
    required String password,
  }) async {
    try {
      await _apiService.postData(
        endpoint: ApiEndpoint.auth(AuthEndpoint.REGISTER),
        data: {
          "name": name,
          "surname": surname,
          "email": email,
          "password": password,
          "mobile_number": mobileNumber,
          "gender": gender,
          "date_of_birth": dateOfBirth,
          "role": "subject"
        },
        parser: (_) {},
        requiresAuthToken: false,
      );
    } catch (e) {
      rethrow;
    }
  }
}
