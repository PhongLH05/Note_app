import 'package:flutter/material.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/widget/new_notes.dart';
import 'package:note_app/widget/note_list/note_list.dart';
import 'package:intl/intl.dart';

class HomeNote extends StatefulWidget {
  const HomeNote({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeNoteState();
  }
}

class _HomeNoteState extends State<HomeNote> {
  
  String get formattedDate {
    return formatter.format(DateTime.now());
  }

  final List<Note> _registeredNote = [
    Note(
      title: 'Hang out',
      content: 'hjklfhal sfhl',
      date: DateTime.now(),
    ),
    Note(
      title: 'Playing sport',
      content: 'Go out and play',
      date: DateTime.now(),
    )
  ];

  void _openAddNotesOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewNotes(onAddNote: _addNote));
  }

  void _addNote(Note note) {
    setState(() {
      _registeredNote.add(note);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text(
            formattedDate,
          ),
          Expanded(
            child: NoteList(notes: _registeredNote),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: FloatingActionButton(
                  onPressed: _openAddNotesOverlay,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      );
  }
}