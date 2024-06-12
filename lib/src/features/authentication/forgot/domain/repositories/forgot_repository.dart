import 'package:myapp/src/core/resources/data_state.dart';

abstract class ForgotRepository {
  Future<DataState> forgotPassword(String email);
}
