// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/consvalue.dart';

signup(BuildContext context, TextEditingController name, TextEditingController phone, TextEditingController password) async {
  // API endpoint URL
  var apiUrl = '${ConsValues.baseurl}signup.php'; // Replace with your API endpoint URL

  // Prepare the request body
  var body = {
    "name": name.text,
    "phone": phone.text,
    "password": password.text,
  };

  // Send the POST request
  var response = await http.post(Uri.parse(apiUrl), body: body);

  // Debug statement to print the response body
  print(response.body);

  // Handle the response
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var message = data['message'];

    if (message is String) {
      // Handle the string message
      if (message == 'User registered successfully') {
        Get.offAllNamed(Approute.Login);
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Sign Up Error'),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    } else if (message is List) {
      // Handle the list of messages (if needed)
      if (message.isNotEmpty) {
        message = message.join('\n'); // Join the list into a single string
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sign Up Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  } else if (response.statusCode == 400) {
    var data = jsonDecode(response.body);
    var message = data['message'];

    if (message is String) {
      // Handle the string message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sign Up Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else if (message is List) {
      // Handle the list of messages (if needed)
      if (message.isNotEmpty) {
        message = message.join('\n'); // Join the list into a single string
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sign Up Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  } else {
    throw Exception('Failed to sign up: ${response.statusCode}');
  }
}
