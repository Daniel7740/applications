import 'package:dio/dio.dart';
import 'package:jokes/core/network/models/joke_model.dart';

abstract class JokesRepository {
  Future<JokeResponse> getQuestionAndAnswer();
}

class JokeResponse {
  final String? error;
  final JokeModel? joke;

  JokeResponse({this.error, this.joke});
}

class JokesRepositoryImpl implements JokesRepository {
  JokesRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<JokeResponse> getQuestionAndAnswer() async {
    Response response;
    try {
      do {
        response = await dio.get('https://icanhazdadjoke.com/');
      } while (!response.data['joke'].toString().contains('?'));
      final String joke = response.data['joke'];
      final array = joke.split('?');
      final responseAnswer = array.last;
      final responseQuestion = '${array.first}?';

      return JokeResponse(
          joke: JokeModel(question: responseQuestion, answer: responseAnswer));
    } catch (e) {
      return JokeResponse(
        error: 'Error',
      );
    }
  }
}
