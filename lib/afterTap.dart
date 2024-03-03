import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final Map<String, dynamic> userDetails;

  const UserDetailsPage({Key? key, required this.userDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userDetailsRow('First Name', userDetails['firstName']),
            userDetailsRow('Last Name', userDetails['lastName']),
            userDetailsRow('Email', userDetails['email']),
            userDetailsRow('Mobile', userDetails['mobile']),
          ],
        ),
      ),
    );
  }

  Widget userDetailsRow(String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            // padding: EdgeInsets.all(12.0),
            padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          Padding(
            // padding: EdgeInsets.symmetric(horizontal: 12.0),
            padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
