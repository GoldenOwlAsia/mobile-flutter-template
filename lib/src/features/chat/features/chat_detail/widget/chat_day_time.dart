import 'package:flutter/material.dart';
import '../../../../../utils/date/date_helper.dart';

class ChatDayTime extends StatelessWidget {
  const ChatDayTime(this.time, {super.key});
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, top: 16),
      alignment: Alignment.center,
      child: Text(
        DateHelper.getDateChatDetails(time).toUpperCase(),
        style: const TextStyle(fontSize: 12, color: Colors.black),
      ),
    );
  }
}
