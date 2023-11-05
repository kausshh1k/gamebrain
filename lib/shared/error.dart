import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({super.key, this.message = 'it broke'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '**********************************tatti error${message}',
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}
