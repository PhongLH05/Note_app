import 'package:flutter/material.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/widget/home_note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem(this.note, {super.key});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // _registeredNote;
        },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Text(note.title),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(child: Text(note.content)),
                ],
              ),
            ],
          ),
        ),
      ),
     ),
    );
  }
}
