import 'package:flutter/material.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/widget/note_list/note_item.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key, required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (ctx, index) => NoteItem(notes[index]),
    );
  }
}
