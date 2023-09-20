import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rsk_electronic_queue/feature/domain/repositories/auth_repo.dart';

class LoginCubit extends Cubit<LoginCubitStates> {
  LoginCubit({
    required this.authRepo,
  }) : super(LoginInitialState());

  final AuthRepo authRepo;

  Future<void> getSMS({required String phone}) async {
    emit(LoginLoadingState());

    final result = await authRepo.getSMS(phone: phone);
    if (result.errorText == null) {
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }

  initialisation() {}
}

abstract class LoginCubitStates {}

class LoginLoadingState extends LoginCubitStates {}

class LoginInitialState extends LoginCubitStates {}

class LoginSuccessState extends LoginCubitStates {}

class LoginErrorState extends LoginCubitStates {}
