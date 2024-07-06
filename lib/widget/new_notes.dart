import 'package:flutter/material.dart';
import 'package:note_app/model/note.dart';

class NewNotes extends StatefulWidget {
  const NewNotes({super.key, required this.onAddNote});

  final void Function(Note note) onAddNote;

  @override
  State<NewNotes> createState() {
    return _NewNotesState();
  }
}

class _NewNotesState extends State<NewNotes> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submitData() {
    if (_titleController.text.trim().isEmpty ||
        _contentController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text('Something is wrong'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Okey'))
                ],
              ));
      return;
    }

    widget.onAddNote(Note(
        title: _titleController.text,
        content: _contentController.text,
        date: DateTime.now()));
        Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: _contentController,
            decoration: const InputDecoration(
              label: Text('Content'),
            ),
            maxLines: null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                    const SizedBox(width: 8,),
                ElevatedButton(
                  onPressed: _submitData,
                  child: const Text('Save'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
