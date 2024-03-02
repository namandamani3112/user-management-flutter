import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DeleteUserMethod extends StatefulWidget {
  @override
  _DeleteUserMethodState createState() => _DeleteUserMethodState();
}

class _DeleteUserMethodState extends State<DeleteUserMethod> {
  TextEditingController mobileController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
  Future<void> deleteUser(String mobile) async {
    String apiUrl = 'https://user-management-backend-7oqi.onrender.com/user/$mobile';

    try {
      var response = await http.delete(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // User deleted successfully
        print('User with mobile number $mobile deleted successfully');
        _showSnackBar('Deleted Successfully');
      } else {
        // User deletion failed
        print('Failed to delete user. Status code: ${response.statusCode}');
        _showSnackBar('Failed to delete user');
      }
    } catch (error) {
      // Error occurred while deleting user
      print('Error occurred while deleting user: $error');
      _showSnackBar('Error occurred while deleting user');

    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete User'),
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
                  controller: mobileController,
                  decoration: InputDecoration(
                    labelText: 'Enter Mobile Number',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String mobile = mobileController.text;
                    deleteUser(mobile);
                  },
                  child: Center(child: Text('Delete')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
