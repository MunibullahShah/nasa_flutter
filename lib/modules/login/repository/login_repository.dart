import 'package:nasa_flutter/modules/login/model/login_model.dart';
import 'package:nasa_flutter/utils/network/backend_repository.dart';

class LoginRepository {
  login(LoginModel user) async {
    await BackendRepository().login(user);
  }
}
