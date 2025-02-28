import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/flashcard.dart';

class ManageScreen extends StatefulWidget {
  @override
  _ManageScreenState createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  late Box<Flashcard> flashcardBox;

  @override
  void initState() {
    super.initState();
    flashcardBox = Hive.box<Flashcard>('flashcards');
  }

  void _addFlashcard() {
    TextEditingController questionController = TextEditingController();
    TextEditingController answerController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Flashcard"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: questionController,
                decoration: InputDecoration(labelText: "Pregunta"),
              ),
              TextField(
                controller: answerController,
                decoration: InputDecoration(labelText: "Respuesta"),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancelar"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("Guardar"),
              onPressed: () {
                final newFlashcard = Flashcard(
                  question: questionController.text,
                  answer: answerController.text,
                );
                flashcardBox.add(newFlashcard);
                setState(() {});
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteFlashcard(int index) {
    flashcardBox.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Administrar Flashcards")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.blueGrey,
        child: ListView.builder(
          itemCount: flashcardBox.length,
          itemBuilder: (context, index) {
            final flashcard = flashcardBox.getAt(index);
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                title: Text(flashcard!.question),
                subtitle: Text(flashcard.answer),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteFlashcard(index),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF2C2C2C),
        onPressed: _addFlashcard,
      ),
    );
  }
}
