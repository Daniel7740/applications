import 'package:rsk_electronic_queue/feature/domain/entities/base_response.dart';

abstract class AuthRepo {
  Future<BaseResponse<String>> getSMS({required String phone});
  Future<void> verifySMS();
}
