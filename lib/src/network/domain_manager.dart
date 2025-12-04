import 'package:injectable/injectable.dart';
import 'package:myapp/src/network/blob/data/upload_repository.dart';
import 'package:myapp/src/network/data/sign/sign_repository.dart';
import 'package:myapp/src/network/data/user/user_repository.dart';

@injectable
class DomainManager {
  final UserRepository user;
  final UploadRepository upload;
  final SignRepository sign;

  DomainManager(this.user, this.upload, this.sign);
}
