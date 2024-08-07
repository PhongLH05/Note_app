import 'package:flutter/material.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/widget/new_notes.dart';
import 'package:note_app/widget/note_list/note_list.dart';

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
      content: 'Nothing',
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

  void _removeNote(Note note) {
    final noteIndex = _registeredNote.indexOf(note);

    setState(() {
      _registeredNote.remove(note);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: const Text('Note Delete'),
        action: SnackBarAction(label: 'Undo', onPressed: () {
          setState(() {
            _registeredNote.insert(noteIndex, note);
          });
        }),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('No note here!', style: TextStyle(fontSize: 24),),);

    if(_registeredNote.isNotEmpty){
      mainContent = NoteList(notes: _registeredNote, onRemovenote: _removeNote);
    }


    return Column(
      children: [
        Text(
          formattedDate,
          style: const TextStyle(fontSize: 18),
        ),
        Expanded(
          child: mainContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
