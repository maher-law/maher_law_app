import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

extension TimestampConverter on Timestamp {
  String toArabic({int timezoneOffset = 2}) {
// Convert Firestore Timestamp to DateTime
    final dateTime = toDate();

    // Adjust for timezone offset (e.g., UTC+2)
    final adjustedDateTime = dateTime.add(Duration(hours: timezoneOffset));

    // Define the Arabic locale
    const arabicLocale = 'ar';

    // Format the date and time in Arabic
    final formattedDate =
        DateFormat('MMMM dd, yyyy', arabicLocale).format(adjustedDateTime);
    // final formattedTime =
    //     DateFormat('hh:mm a', arabicLocale).format(adjustedDateTime);

    // return '$formattedDate في $formattedTime';
    return '$formattedDate ';
  }
}
