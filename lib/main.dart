import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteHomePage(),
    );
  }
}

class NoteHomePage extends StatefulWidget {
  @override
  _NoteHomePageState createState() => _NoteHomePageState();
}

class _NoteHomePageState extends State<NoteHomePage> {
  final _notes = <String>[];
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter your note',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  setState(() {
                    _notes.add(_textController.text);
                    _textController.clear();
                  });
                }
              },
              child: const Text('Add Note'),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_notes[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon:const Icon(Icons.edit),
                        onPressed: () {
                          _showUpdateDialog(index);
                        },
                      ),
                      IconButton(
                        icon:const Icon(Icons.delete),
                        onPressed: () {
                          _showDeleteDialog(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdateDialog(int index) {
    final _updateController = TextEditingController(text: _notes[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Note'),
          content: TextField(
            controller: _updateController,
            decoration: const InputDecoration(
              labelText: 'Enter your updated note',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _notes[index] = _updateController.text;
                });
                Navigator.of(context).pop();
              },
              child:const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:const  Text('Delete Note'),
          content:const  Text('Are you sure you want to delete this note?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:const  Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _notes.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child:const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}