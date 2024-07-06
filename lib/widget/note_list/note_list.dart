import 'package:flutter/material.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/widget/note_list/note_item.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key, required this.notes, required this.onRemovenote});

  final List<Note> notes;
  final void Function(Note note) onRemovenote;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(notes[index]), 
          onDismissed: (direction) {
            onRemovenote(notes[index]);
          },
          child: NoteItem(notes[index])),
    );
  }
}
