import 'package:flutter/material.dart';
import 'package:portfolio/atbash.dart';
import 'package:portfolio/caesar.dart';
import 'package:portfolio/home_page.dart';
import 'package:portfolio/vigenere.dart';

class Chiper extends StatelessWidget {
  const Chiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 0, 30),
        title: const Text('Cipher App', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        // Menu (Drawer)
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF00796B), // Darker green as background
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/profile.jpg'), // Profile picture
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Gerald Dabalos',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('About Me'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('My Work'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Contact Me'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Cipher Text',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Chiper(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 20, 0, 60), // Dark center color
              Color.fromARGB(255, 0, 0, 30), // Outer darker color
              Color.fromARGB(255, 0, 0, 10), // Outermost darker color
            ],
            radius: 1.5,
            center: Alignment(0.3, -0.5), // Adjust to position the glow
            focal: Alignment.center,
            focalRadius: 0.1,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Cipher App',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff00d1ff),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildCipherCard(
                  context,
                  'Atbash Cipher',
                  'The Atbash cipher is a classical substitution cipher that’s super simple but pretty interesting!',
                  'assets/images.jpg',
                  const Atbash(),
                ),
                const SizedBox(height: 30),
                _buildCipherCard(
                  context,
                  'Caesar Cipher',
                  'The Caesar cipher is another classic! It’s one of the oldest and simplest encryption techniques, credited to Julius Caesar.',
                  'assets/caesar.png',
                  const Caesar(),
                ),
                const SizedBox(height: 30),
                _buildCipherCard(
                  context,
                  'Vigenère Cipher',
                  'The Vigenère cipher is a step up from simple substitution ciphers like Caesar!',
                  'assets/vigenere.png',
                  const Vigenere(),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCipherCard(BuildContext context, String title,
      String description, String imagePath, Widget page) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 6, 0, 30),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 6, 0, 30),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff00d1ff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'View',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
