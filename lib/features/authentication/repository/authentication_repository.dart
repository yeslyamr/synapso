import 'package:get_it/get_it.dart';
import 'package:synapso/core/network/api_endpoints.dart';
import 'package:synapso/core/network/api_service.dart';
import 'package:synapso/features/authentication/models/user_model.dart';

class AuthenticationRepository {
  final ApiService _apiService = GetIt.I<ApiService>();

  Future<UserModel> logInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await _apiService.postData<UserModel>(
        endpoint: ApiEndpoint.auth(AuthEndpoint.LOGIN),
        body: {
          "email": email,
          "password": password,
          "role": "subject",
        },
        parser: (json) {
          return UserModel.fromJson(json);
        },
        requiresAuthToken: false,
      );
      if (userModel != null) {
        return userModel;
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signUp({
    required String name,
    required String surname,
    required String mobileNumber,
    required String gender,
    required String dateOfBirth,
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await _apiService.postData<UserModel>(
        endpoint: ApiEndpoint.auth(AuthEndpoint.REGISTER),
        body: {
          "name": name,
          "surname": surname,
          "email": email,
          "password": password,
          "mobile_number": mobileNumber,
          "gender": gender,
          "date_of_birth": dateOfBirth,
          "role": "subject"
        },
        parser: (json) {
          return UserModel.fromJson(json);
        },
        requiresAuthToken: false,
      );

      if (userModel != null) {
        return userModel;
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
