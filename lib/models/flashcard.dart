import 'package:hive/hive.dart';

part 'flashcard.g.dart';

@HiveType(typeId: 0)
class Flashcard {
  @HiveField(0)
  String question;
  @HiveField(1)
  String answer;

  Flashcard({required this.question, required this.answer});

  // Para convertir a JSON si quieres almacenar en Hive o SQLite
  Map<String, dynamic> toJson() {
    return {'question': question, 'answer': answer};
  }

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(question: json['question'], answer: json['answer']);
  }
}
