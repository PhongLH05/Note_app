import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class Note {
  Note({required this.title, required this.content, required this.date});

  final String title;
  final String content;
  final DateTime date;

  String get formattedDate{
    return formatter.format(date);
  }
}
