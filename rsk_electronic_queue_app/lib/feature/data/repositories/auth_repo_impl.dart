import 'package:dio/dio.dart';
import 'package:rsk_electronic_queue/feature/domain/entities/base_response.dart';
import 'package:rsk_electronic_queue/feature/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.dio});
  final Dio dio;

  @override
  Future<BaseResponse<String>> getSMS({required String phone}) async {
    return BaseResponse(model: phone);
  }

  @override
  Future<void> verifySMS() {
    // TODO: implement verifySMS
    throw UnimplementedError();
  }
}
