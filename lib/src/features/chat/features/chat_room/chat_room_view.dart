import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/widgets/state/state_empty_widget.dart';
import 'package:myapp/widgets/state/state_error_widget.dart';
import 'package:myapp/widgets/state/state_loading_widget.dart';
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
              slivers: [_builder(context, state)],
            ),
          );
        },
      ),
    );
  }

  Widget _builder(BuildContext context, ChatRoomState state) {
    if (state.data.isLoading) {
      return const SliverFillRemaining(
        child: XStateLoadingWidget(),
      );
    }
    if (state.data.isError) {
      return const SliverFillRemaining(
        child: XStateErrorWidget(),
      );
    }
    final data = state.listChatAll;
    if (data.isEmpty) {
      return const SliverFillRemaining(
        child: XStateEmptyWidget(),
      );
    }
    return buildListChat(context, state);
  }

  Widget buildListChat(BuildContext context, ChatRoomState state) {
    final listChat = state.listChatAll;
    return SliverList(
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
    );
  }
}
