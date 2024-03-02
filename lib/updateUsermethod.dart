import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UpdateUserMethod extends StatefulWidget {
  @override
  _UpdateUserMethodState createState() => _UpdateUserMethodState();
}

class _UpdateUserMethodState extends State<UpdateUserMethod> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Future<void> updateUser(String mobile, String firstName, String lastName, String email, String phone) async {
    String apiUrl = 'https://user-management-backend-7oqi.onrender.com/user/$mobile';

    Map<String, String> body = {};

    if (firstName.isNotEmpty) {
      body['firstName'] = firstName;
    }
    if (lastName.isNotEmpty) {
      body['lastName'] = lastName;
    }
    if (email.isNotEmpty) {
      body['email'] = email;
    }
    if (phone.isNotEmpty) {
      body['mobile'] = phone;
    }

    try {
      var response = await http.patch(
        Uri.parse(apiUrl),
        body: body,
      );

      if (response.statusCode == 200) {
        // User updated successfully
        print('User with mobile number $mobile updated successfully');
        _showSnackBar('Updated Successfully');
      } else {
        // User update failed
        print('Failed to update user. Status code: ${response.statusCode}');
        _showSnackBar('Failed to update user');
      }
    } catch (error) {
      // Error occurred while updating user
      print('Error occurred while updating user: $error');
      _showSnackBar('Error occurred while updating user');
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Enter User Mobile Number:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Enter Details to be Updated:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                String mobile = mobileController.text;
                String firstName = firstNameController.text;
                String lastName = lastNameController.text;
                String email = emailController.text;
                String phone = phoneController.text;
                updateUser(mobile, firstName, lastName, email, phone);
              },
              child: Center(child: Text('Update')),
            ),
          ],
        ),
      ),
    );
  }
}
