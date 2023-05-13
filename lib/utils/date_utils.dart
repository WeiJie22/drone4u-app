import 'package:intl/intl.dart';

String formatDate(DateTime? dateTime) {
  return DateFormat('dd/MM/yyyy').format(dateTime ?? DateTime.now());
}
