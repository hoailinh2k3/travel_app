import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String get getStartDate {
    DateFormat transactionDateFormat = DateFormat('dd MMM');
    return transactionDateFormat.format(this);
  }

  String get getEndDate {
    DateFormat transactionDateFormat = DateFormat('dd MMM yyyy');
    return transactionDateFormat.format(this);
  }
}
