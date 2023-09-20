// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JokeModel {
  final String question;
  final String answer;
  JokeModel({
    required this.question,
    required this.answer,
  });

  JokeModel copyWith({
    String? question,
    String? answer,
  }) {
    return JokeModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
    };
  }

  factory JokeModel.fromMap(Map<String, dynamic> map) {
    return JokeModel(
      question: map['question'] as String,
      answer: map['answer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JokeModel.fromJson(String source) =>
      JokeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'JokeEntity(question: $question, answer: $answer)';

  @override
  bool operator ==(covariant JokeModel other) {
    if (identical(this, other)) return true;

    return other.question == question && other.answer == answer;
  }

  @override
  int get hashCode => question.hashCode ^ answer.hashCode;
}
