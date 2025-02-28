import 'package:flutter/material.dart';
import 'manage_screen.dart';
import 'review_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Memory Cards',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width:
                    MediaQuery.of(context).size.width *
                    0.7, // 70% del ancho de la pantalla
                height:
                    MediaQuery.of(context).size.height *
                    0.1, // 30% del alto de la pantalla
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2C2C2C),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Repasar',
                    style: TextStyle(fontSize: 21, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReviewScreen()),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width:
                    MediaQuery.of(context).size.width *
                    0.7, // 70% del ancho de la pantalla
                height:
                    MediaQuery.of(context).size.height *
                    0.1, // 30% del alto de la pantalla
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2C2C2C),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Gestionar Flashcards',
                    style: TextStyle(fontSize: 21, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManageScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
