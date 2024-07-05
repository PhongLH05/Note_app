import 'package:flutter/material.dart';
import 'package:note_app/widget/home_note.dart';
import 'package:intl/intl.dart';
import 'package:note_app/widget/user_note.dart';

final formatter = DateFormat.yMd();

class Notes extends StatefulWidget {
  const Notes({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NotesState();
  }
}

class _NotesState extends State<Notes> {
  final tabs = [const HomeNote(), const UserNote()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 17,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'User',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
