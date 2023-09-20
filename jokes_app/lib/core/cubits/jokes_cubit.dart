import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/core/network/models/joke_model.dart';
import 'package:jokes/core/network/repository/jokes_repository.dart';

class JokesCubit extends Cubit<JokeStates> {
  JokesCubit({required this.repo})
      : super(
          InitialState(
            joke: JokeModel(answer: '', question: ''),
          ),
        );

  final JokesRepository repo;

  Future<void> getQuestion() async {
    emit(LoadingState(joke: state.joke));

    final result = await repo.getQuestionAndAnswer();

    if (result.error == null) {
      emit(SuccessState(joke: result.joke!));
    } else {
      emit(ErrorState(joke: state.joke));
    }
  }
}

abstract class JokeStates {
  JokeStates({required this.joke});
  final JokeModel joke;
}

class InitialState extends JokeStates {
  InitialState({required this.joke}) : super(joke: joke);
  @override
  final JokeModel joke;
}

class LoadingState extends JokeStates {
  LoadingState({required this.joke}) : super(joke: joke);
  @override
  final JokeModel joke;
}

class SuccessState extends JokeStates {
  SuccessState({required this.joke}) : super(joke: joke);
  @override
  final JokeModel joke;
}

class ErrorState extends JokeStates {
  ErrorState({required this.joke}) : super(joke: joke);
  @override
  final JokeModel joke;
}
