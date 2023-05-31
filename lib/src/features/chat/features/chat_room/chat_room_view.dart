import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/chat_room_cubit.dart';
import '../../widget/chat_room_card.dart';

class ChatRoomView extends StatelessWidget {
  const ChatRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatRoomCubit(),
      child: BlocBuilder<ChatRoomCubit, ChatRoomState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Chat'),
            ),
            body: CustomScrollView(
              slivers: [buildListChat(context, state)],
            ),
          );
        },
      ),
    );
  }

  Widget buildListChat(BuildContext context, state) {
    final listChat = state.listChatAll;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = listChat[index];
            final isOnline = state.isOnlineOfRom(item);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ChatRoomCard(
                  chatRoom: item,
                  isOnline: isOnline,
                  currentId: state.currentId,
                ),
                const Divider(height: 1, indent: 86, endIndent: 20),
              ],
            );
          },
          childCount: listChat.length,
        ),
      ),
    );
  }
}
