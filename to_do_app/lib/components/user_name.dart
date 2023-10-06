// Имя пользователя
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  const UserName({
    Key? key,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            firstName,
            style: const TextStyle(
              fontSize: 45,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            lastName,
            style: const TextStyle(
              fontSize: 45,
            ),
          ),
        ],
      ),
    );
  }
}
