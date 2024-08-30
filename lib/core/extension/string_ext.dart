import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _nepFormatter = NumberFormat.simpleCurrency(
    decimalDigits: 0, name: 'Rs. ', locale: 'hi-IN');

extension StringExt on String {
  /// Get HardCoded String to use later for localization
  String get hardcoded => this;

  /// first letter capitalize
  String capitalize() => trim().isEmpty
      ? ''
      : trim().substring(0, 1).toUpperCase() + trim().substring(1);

  /// format currency to current date
  String toNepaliCurrency() => _nepFormatter.format(trim());

  /// covert date time to hours
  String toHourMinuteFormat(DateTime dateTime, {String format = 'hh:mma'}) {
    try {
      final dateFormat = DateFormat(format);
      return dateFormat.format(dateTime).toLowerCase();
    } catch (_) {
      return '';
    }
  }

  String getSize() {
    final kb = double.parse(trim()) / 1024;
    final mb = kb / 1024;

    if (kb > 1024) {
      return '${mb.toStringAsFixed(2)} MB';
    } else if (kb <= 1024) {
      return '${kb.toStringAsFixed(2)} KB';
    } else {
      return '${double.parse(trim()).toStringAsFixed(2)} Bytes';
    }
  }

  ///custom date format
  String formatDateTime(
    DateTime datetime, {
    String format = 'dd/MM/yyyy hh:mm a',
  }) =>
      DateFormat(format).format(datetime);

  String getFirstLetters({bool isStartEnd = false}) {
    try {
      // Remove leading and trailing whitespace
      final trimmedString = trim();

      // Check if the string is empty or only contains whitespace
      if (trimmedString.isEmpty) {
        return '';
      }

      // Split the string by whitespace
      final words = trimmedString.split(RegExp(r'\s+'));

      // Filter out empty strings after splitting
      final nonEmptyWords = words.where((word) => word.isNotEmpty);

      // Extract the first letter from each word
      final firstLetters = nonEmptyWords
          .map((word) {
            // Handle surrogate pairs for characters outside the BMP
            return word.runes.firstWhere((rune) => rune != 0, orElse: () => 0);
          })
          .where((rune) => rune != 0)
          .map((rune) => String.fromCharCode(rune));

      if (firstLetters.isNotEmpty && isStartEnd && firstLetters.length > 1) {
        return '${firstLetters.first}${firstLetters.last}';
      }

      // Join the first letters together
      return firstLetters.join();
    } catch (_) {
      return '';
    }
  }
}

/// Formats duration in milliseconds to xx:xx:xx format.
String durationFormatter(int milliSeconds) {
  var seconds = milliSeconds ~/ 1000;
  final hours = seconds ~/ 3600;
  seconds = seconds % 3600;
  var minutes = seconds ~/ 60;
  seconds = seconds % 60;
  final hoursString = hours >= 10
      ? '$hours'
      : hours == 0
          ? '00'
          : '0$hours';
  final minutesString = minutes >= 10
      ? '$minutes'
      : minutes == 0
          ? '00'
          : '0$minutes';
  final secondsString = seconds >= 10
      ? '$seconds'
      : seconds == 0
          ? '00'
          : '0$seconds';
  final formattedTime =
      '${hoursString == '00' ? '' : '$hoursString:'}$minutesString:$secondsString';
  return formattedTime;
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return '$minutes:$seconds';
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  final formatter =
      DateFormat.jm(); // 'jm' format represents the 12-hour format with AM/PM
  return formatter.format(dateTime);
}

String formatTime(TimeOfDay? time) {
  if (time != null) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final formatter = DateFormat.jm();
    return formatter.format(dateTime);
  }
  return '';
}

String formatDateRange(
  DateTimeRange? dateRange, {
  bool useYearInEndFormat = true,
}) {
  if (dateRange == null) {
    return '';
  }

  bool isSameDay =
      DateTime.parse(dateRange.start.toIso8601String().substring(0, 10))
          .isAtSameMomentAs(
              DateTime.parse(dateRange.end.toIso8601String().substring(0, 10)));
  final startFormatter = isSameDay && useYearInEndFormat
      ? DateFormat('EEE MMM dd yyyy')
      : DateFormat('EEE, MMM dd');
  final endFormatter =
      useYearInEndFormat ? DateFormat('EEE MMM dd yyyy') : DateFormat('dd');

  final start = startFormatter.format(dateRange.start);
  final end = endFormatter.format(dateRange.end);

  return isSameDay
      ? start
      : useYearInEndFormat
          ? '$start to $end'
          : '$start - $end';
}

/// Returns a string representation of the given [DateTime] object.
/// For example: 4:30 PM, 1 Jan 2021, 3 hours ago, etc.
String timesAgo(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays > 0) {
    return DateFormat('d MMM yyyy').format(dateTime);
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hours ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minutes ago';
  } else {
    return 'Just now';
  }
}

String timesAgoForComment(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  //show if just now days ago and weeks ago
  if (difference.inDays == 0) {
    if (difference.inHours == 0) {
      if (difference.inMinutes == 0) {
        return 'Just now';
      } else {
        return '${difference.inMinutes}m ago';
      }
    } else {
      return '${difference.inHours}h ago';
    }
  } else if (difference.inDays == 1) {
    return 'Yesterday';
  } else if (difference.inDays < 7) {
    return '${difference.inDays}d ago';
  } else {
    // retunr weeks ago
    return '${difference.inDays ~/ 7}w ago';
  }
}
