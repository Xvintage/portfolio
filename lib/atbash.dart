// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import "package:flutter/material.dart";

class Atbash extends StatefulWidget {
  const Atbash({super.key});

  @override
  _AtbashState createState() => _AtbashState();
}

class _AtbashState extends State<Atbash> {
  final TextEditingController inputController = TextEditingController();
  final TextEditingController resultController = TextEditingController();

  String get accountName => 'ssss';

  // Atbash cipher function
  String performAtbash(String input) {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const reversedAlphabet = 'ZYXWVUTSRQPONMLKJIHGFEDCBA';

    return input.toUpperCase().split('').map((char) {
      final index = alphabet.indexOf(char);
      return index != -1 ? reversedAlphabet[index] : char;
    }).join('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(255, 20, 0, 60),
            Color.fromARGB(255, 0, 0, 30),
            Color.fromARGB(255, 0, 0, 10),
          ],
          radius: 1.5,
          center: Alignment(0.3, -0.5),
          focal: Alignment.center,
          focalRadius: 0.1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 6, 0, 30),
          iconTheme: IconThemeData(color: Colors.white),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => Chiper(),
          //         ),
          //         );
          //     },
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: Row(
                children: [
                  Text(
                    'ATBASH Cipher',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff00d1ff)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),

            // Text Field for Atbash Cipher Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: inputController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00d1FF)),
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Enter Text here...',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Decode Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: () {
                  final inputText = inputController.text;
                  final result = performAtbash(inputText);
                  setState(() {
                    resultController.text = result;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFF00D1FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Decode',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Result',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
            SizedBox(height: 20),

            // Result Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: resultController,
                readOnly: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00d1FF)),
                      borderRadius: BorderRadius.circular(12)),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
