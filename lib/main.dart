import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'signupmethod.dart';
import 'getusermethod.dart';
import 'deleteusermethod.dart';
import 'updateusermethod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal, // Changing primary color
        scaffoldBackgroundColor: Colors.grey[200], // Changing background color
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // Changing button color
            foregroundColor: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Making buttons larger
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Making buttons larger
          ),
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/getuser': (context) => GetUserMethod(),
        '/deleteuser': (context) => DeleteUserMethod(),
        '/updateuser': (context) => UpdateUserMethod(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Management',
          style: TextStyle(
            fontSize: 20, // Changing app bar title font size
            fontWeight: FontWeight.bold, // Making app bar title bold
          ),
        ),
        centerTitle: true, // Centering app bar title
        elevation: 0, // Removing app bar elevation
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpMethod()),
                    );
                  },
                  child: Text('Signup'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/getuser');
                  },
                  child: Text('Get User'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/updateuser');
                  },
                  child: Text('Update User'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/deleteuser');
                  },
                  child: Text('Delete User'),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Text(
              'Made By - Naman Damani\n Under the guidance of ChatGPT & Yash',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
