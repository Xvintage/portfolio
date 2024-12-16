import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutMePage(),
    );
  }
}

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E595),
      appBar: AppBar(
        backgroundColor: Color(0xFFE9E595),
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          'About me',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  'assets/profile.png',
                ),
              ),
              SizedBox(height: 16),
              Text(
                "I'm Kyle Busalla",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "I AM KYLE BUSALLA, AND I AM AN IT STUDENT FROM DAVAO DEL NORTE STATE COLLEGE AND AN UPCOMING 3RD YEAR STUDENT. MY JOURNEY AS AN IT STUDENT STARTED WITH BEING SIMPLY FASCINATED BY HOW TECHNOLOGIES WORK AND EVENTUALLY TURNED INTO A CURIOSITY, WHICH SERVED AS A DRIVING FORCE FOR ME TO PURSUE A BACHELOR OF SCIENCE IN INFORMATION TECHNOLOGY (BSIT).",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32),
              Text(
                "- Outputs",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/project4.png',
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Image.asset(
                      'assets/project1.png',
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutMePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CipherTextPage(cipher: 'atbash')),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CipherTextPage(cipher: 'caesar')),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CipherTextPage(cipher: 'vigenere')),
            );
          } else if (index == 4) {
            // Add logout functionality here
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security),
            label: 'Atbash',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Caesar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.enhanced_encryption),
            label: 'Vigenere',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}

class CipherTextPage extends StatefulWidget {
  final String cipher;

  CipherTextPage({required this.cipher});

  @override
  _CipherTextPageState createState() => _CipherTextPageState();
}

class _CipherTextPageState extends State<CipherTextPage> {
  String inputText = "";
  String resultText = "";
  int caesarKey = 3; // Default key for Caesar cipher
  String vigenereKey = "key"; // Default key for Vigenère cipher

  String atbashCipher(String text) {
    return text.split('').map((char) {
      if (char.toLowerCase().compareTo('a') >= 0 &&
          char.toLowerCase().compareTo('z') <= 0) {
        int diff = char.toLowerCase().codeUnitAt(0) - 'a'.codeUnitAt(0);
        return String.fromCharCode('z'.codeUnitAt(0) - diff);
      }
      return char;
    }).join();
  }

  String caesarCipher(String text, int shift) {
    return text.split('').map((char) {
      if (char.toLowerCase().compareTo('a') >= 0 &&
          char.toLowerCase().compareTo('z') <= 0) {
        int base =
            char.toLowerCase() == char ? 'a'.codeUnitAt(0) : 'A'.codeUnitAt(0);
        return String.fromCharCode(
          base + (char.codeUnitAt(0) - base + shift) % 26,
        );
      }
      return char;
    }).join();
  }

  String vigenereCipher(String text, String key) {
    key = key.toLowerCase();
    int keyIndex = 0;
    return text.split('').map((char) {
      if (char.toLowerCase().compareTo('a') >= 0 &&
          char.toLowerCase().compareTo('z') <= 0) {
        int shift =
            key[keyIndex % key.length].codeUnitAt(0) - 'a'.codeUnitAt(0);
        keyIndex++;
        return caesarCipher(char, shift);
      }
      return char;
    }).join();
  }

  void processCipher() {
    setState(() {
      switch (widget.cipher) {
        case 'atbash':
          resultText = atbashCipher(inputText);
          break;
        case 'caesar':
          resultText = caesarCipher(inputText, caesarKey);
          break;
        case 'vigenere':
          resultText = vigenereCipher(inputText, vigenereKey);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE9E595),
        title: Text('${widget.cipher} Cipher',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFFE9E595), const Color(0xFFE9E595)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Enter text to encode or decode using the ${widget.cipher} cipher.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Enter text',
                        prefixIcon:
                            Icon(Icons.text_fields, color: Colors.deepPurple),
                      ),
                      onChanged: (text) {
                        inputText = text;
                      },
                    ),
                    if (widget.cipher == 'caesar') ...[
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Enter Caesar key (integer)',
                          prefixIcon:
                              Icon(Icons.vpn_key, color: Colors.deepPurple),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          caesarKey =
                              int.tryParse(text) ?? 3; // Default key if invalid
                        },
                      ),
                    ],
                    if (widget.cipher == 'vigenere') ...[
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Enter Vigenère key (text)',
                          prefixIcon:
                              Icon(Icons.vpn_key, color: Colors.deepPurple),
                        ),
                        onChanged: (text) {
                          vigenereKey = text.isNotEmpty
                              ? text
                              : "key"; // Default key if empty
                        },
                      ),
                    ],
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEFD9B4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      onPressed: processCipher,
                      child: Text('Encode/Decode',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(height: 20),
                    if (resultText.isNotEmpty)
                      Text(
                        'Result: $resultText',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
