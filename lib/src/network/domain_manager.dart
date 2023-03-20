import 'package:myapp/src/network/data/sign/sign_repository.dart';
import 'package:myapp/src/network/data/sign/sign_repository_impl.dart';

import 'data/user/user_repository.dart';
import 'data/user/user_repository_impl.dart';

class DomainManager {
  factory DomainManager() => I;
  DomainManager._internal() {
    user = UserRepositoryImpl();
    sign = SignRepositoryImpl();
  }

  static final DomainManager I = DomainManager._internal();

  late UserRepository user;
  late SignRepository sign;
}
