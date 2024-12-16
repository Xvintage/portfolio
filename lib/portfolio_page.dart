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
      backgroundColor: Color(0xFFEFD9B4), // Light beige color
      appBar: AppBar(
        backgroundColor: Color(0xFFEFD9B4),
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
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150', // Replace with your image URL
                ),
              ),
              SizedBox(height: 16),
              Text(
                "I'm Aljame",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Exploring the front-end development field and turning my imagination into sketches, Photoshop and coding HTML/CSS. I love to combine creativity with functionality, crafting designs that look great and provide a delightful user experience. Whether it is improving visuals or creating interactive web layouts, I am eager to learn more about digital design and front-end development.",
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
                    child: Image.network(
                      'https://via.placeholder.com/200', // Replace with output image URL
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Image.network(
                      'https://via.placeholder.com/200', // Replace with output image URL
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
    );
  }
}
