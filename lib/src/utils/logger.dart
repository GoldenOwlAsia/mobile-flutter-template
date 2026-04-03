import 'package:logger/logger.dart';

/// Global logger instance for application-wide logging
final Logger xLog = Logger(
  filter: DevelopmentFilter(),
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    dateTimeFormat: DateTimeFormat.dateAndTime,
  ),
  output: ConsoleOutput(),
);
