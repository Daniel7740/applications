import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit()
      : super(
          SplashInitialState(),
        );

  Future<void> initialisation() async {
    late bool isAuthorized =
        false; // Инициализация переменной isAuthorized, представляющей авторизацию пользователя, со значением по умолчанию false
    await Future.delayed(
      const Duration(seconds: 6), // Ожидание в течение 3 секунд
    );
    if (isAuthorized) {
      emit(
        SplashAuthorizedState(), // Если пользователь авторизован, эмитируется состояние MapPage
      );
    } else {
      emit(
        SplashUnauthorizedState(), // Если пользователь не авторизован, эмитируется состояние SplashUnauthorizedState
      );
    }
  }
}

abstract class SplashStates {}

class SplashInitialState
    extends SplashStates {} // Класс, представляющий начальное состояние экрана сплеша

class SplashAuthorizedState
    extends SplashStates {} // Класс, представляющий состояние экрана сплеша для авторизованного пользователя

class SplashUnauthorizedState
    extends SplashStates {} // Класс, представляющий состояние экрана сплеша для неавторизованного пользователя
