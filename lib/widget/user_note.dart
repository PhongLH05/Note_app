import 'package:flutter/material.dart';

class UserNote extends StatelessWidget {
  const UserNote({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/image/avatar.jpg'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Username', style: TextStyle(fontSize: 16),),    
          ),
          Divider(
              height: 30,
              thickness: 2,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }
}