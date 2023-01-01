import 'package:nasa_flutter/modules/login/model/login_model.dart';
import 'package:nasa_flutter/utils/network/backend_repository.dart';

class RegistrationRepository {
  register(LoginModel user) async {
    try {
      await BackendRepository().createUser(user);
    } catch (e) {
      throw Exception('register error');
    }
  }
}
