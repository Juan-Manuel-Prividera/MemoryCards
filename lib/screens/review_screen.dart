import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/flashcard.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  late Box<Flashcard> flashcardBox;
  int currentIndex = 0;
  bool showAnswer = false;

  @override
  void initState() {
    super.initState();
    flashcardBox = Hive.box<Flashcard>('flashcards');
  }

  void _nextFlashcard() {
    if (currentIndex < flashcardBox.length - 1) {
      setState(() {
        currentIndex++;
        showAnswer = false;
      });
    }
  }

  void _prevFlashcard() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        showAnswer = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (flashcardBox.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Repasar Flashcards')),
        body: Center(child: Text('No hay flashcards disponibles')),
      );
    }

    final flashcard = flashcardBox.getAt(currentIndex);

    return Scaffold(
      appBar: AppBar(title: Text('Repasar Flashcards')),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  showAnswer = !showAnswer;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                width:
                    MediaQuery.of(context).size.width *
                    0.8, // 80% del ancho de la pantalla
                height:
                    MediaQuery.of(context).size.height *
                    0.3, // 30% del alto de la pantalla

                child: Center(
                  child: Text(
                    showAnswer ? flashcard!.answer : flashcard!.question,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 32),
                  onPressed: _prevFlashcard,
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, size: 32),
                  onPressed: _nextFlashcard,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
