import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http; // Import the http package

class SignUpMethod extends StatefulWidget {
  @override
  _SignUpMethodState createState() => _SignUpMethodState();
}

class _SignUpMethodState extends State<SignUpMethod> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }


  Future<void> _signUp() async {
    // Extract user input
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String mobile = mobileController.text;

    // API endpoint
    String apiUrl = 'https://user-management-backend-7oqi.onrender.com/user/signup';
    print(apiUrl);

    try {
      // Make POST request to signup API
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'mobile': mobile,
        },
      );

      // Check if request was successful (status code 200)
      if (response.statusCode == 200) {
        // Signup successful
        print('User signed up successfully');
        _showSnackBar('User signed up successfully');


      } else {
        // Signup failed
        _showSnackBar('Failed to sign up user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors
      _showSnackBar('Error occurred while signing up: $error');
    }
    Navigator.pop(context);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email ID',
                  ),
                ),
                TextField(
                  controller: mobileController,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _signUp,
                  child: Center(child: Text('Signup')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
