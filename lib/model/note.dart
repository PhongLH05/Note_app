import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class Note {
  Note({required this.title, required this.content, required this.date});

   String title;
   String content;
  final DateTime date;

  String get formattedDate{
    return formatter.format(date);
  }
  
}
