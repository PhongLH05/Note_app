import 'package:flutter/material.dart';
import 'package:note_app/model/note.dart';


class NoteItem extends StatelessWidget {
  const NoteItem(this.note, {super.key});

  final Note note;
  

  // void _showUpdateDialog (int index){
  //   var _updateTitleController = TextEditingController(text: _registeredNote[index].title);
  //   var _updateContentController = TextEditingController(text: _registeredNote[index].content);

  //   setState(() {
  //     _updateTitleController = _registeredNote(index)
  //     _updateContentController = _registeredNote[index].content as TextEditingController;
  //   });

  //   showModalBottomSheet(
  //     context: context, 
  //     builder: (context) {
  //       return Padding(
  //     padding: const EdgeInsets.all(16),
  //     child: Column(
  //       children: [
  //         TextField(
  //           controller: _updateTitleController,
  //           maxLength: 50,
  //           decoration: const InputDecoration(
  //             label: Text('Title'),
  //           ),
  //         ),
  //         TextField(
  //           controller: _updateContentController,
  //           decoration: const InputDecoration(
  //             label: Text('Content'),
  //           ),
  //           maxLines: null,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 20),
  //           child: Row(
  //             children: [
  //               TextButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text('Cancel')),
  //                   const SizedBox(width: 8,),
  //               ElevatedButton(
  //                 onPressed: () {},
  //                 child: const Text('Save'),
  //               )
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  //     }
  //     );
  // }



  @override
  Widget build(BuildContext context) {
    return Card(
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
                // Checkbox(value: , onChanged: onChanged),
                Expanded(child: Text(note.content)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
