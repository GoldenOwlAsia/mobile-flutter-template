import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/packages/dismiss_keyboard/dismiss_keyboard.dart';
import 'package:myapp/src/network/model/common/handle.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../../../../widgets/common/indicator.dart';
import '../../../network/model/message/chat_message.dart';
import '../../../network/model/room/chat_room.dart';
import '../../../theme/chat_theme.dart';
import '../../../theme/inherited_chat_theme.dart';
import '../logic/chat_detail/chat_detail_cubit.dart';
import '../logic/send_message/send_message_cubit.dart';
import '../widget/chat_bottom_bar/chat_bottom_bar.dart';
import '../widget/chat_day_time.dart';
import '../widget/message_item_card.dart';
import '../widget/scroll_bottom_button.dart';

class ChatDetailView extends StatelessWidget {
  const ChatDetailView({super.key, required this.room});
  final MChatRoom room;
  @override
  Widget build(BuildContext context) {
    return InheritedChatTheme(
      theme: const DefaultChatTheme(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ChatDetailCubit(room)),
          BlocProvider(create: (_) => SendMessageCubit(room)),
        ],
        child: BlocBuilder<ChatDetailCubit, ChatDetailState>(
          buildWhen: (p, c) => p.room != c.room,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.currentMember().name),
                centerTitle: true,
              ),
              floatingActionButton:
                  BlocBuilder<ChatDetailCubit, ChatDetailState>(
                      buildWhen: (p, c) => p.showScrollDown != c.showScrollDown,
                      builder: (context, state) {
                        if (state.showScrollDown == false) {
                          return const SizedBox.shrink();
                        }
                        return Container(
                          margin: const EdgeInsets.only(bottom: 128.0),
                          child: ScrollToBottomButton(
                            onPressed: () => context
                                .read<ChatDetailCubit>()
                                .scrollToBottom(),
                          ),
                        );
                      }),
              body: DismissKeyBoard(
                child: Column(
                  children: [
                    Expanded(child: _builder()),
                    const ChatBottomBar(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  BlocBuilder<ChatDetailCubit, ChatDetailState> _builder() {
    return BlocBuilder<ChatDetailCubit, ChatDetailState>(
      buildWhen: (previous, current) =>
          previous.listMessToShow != current.listMessToShow,
      builder: (context, state) {
        return _buildListMessage(context, state);
      },
    );
  }

  Widget _buildListMessage(BuildContext context, ChatDetailState state) {
    final messages = state.listMessToShow;
    return ScrollablePositionedList.builder(
      reverse: true,
      padding: const EdgeInsets.only(bottom: 16, top: 24),
      itemCount: state.listMessToShow.length,
      itemScrollController:
          context.read<ChatDetailCubit>().listViewScrollController,
      itemPositionsListener:
          context.read<ChatDetailCubit>().listViewPositionsListener,
      itemBuilder: (context, index) {
        final showTime = showTimeDay(index, state.listMessToShow);
        final Widget? timeWidget = showTime
            ? ChatDayTime(state.listMessToShow[index].createdAt.toDate())
            : null;

        final isLastMessage = index == (messages.length - 1);
        final item = messages[index];
        final itemWidget = MessageItemCard(
          key: Key(item.id),
          showAvatar: showAvatar(state.currentId, index, messages),
          message: item,
          isYour: item.idUserFrom == state.currentId,
          chatMember: state.room.memberOf(item.idUserFrom),
          onLongPressMessage: (message) {
            context
                .read<SendMessageCubit>()
                .onLongPressMessage(context, message);
          },
          onTapAvatar: (member) {
            context.read<ChatDetailCubit>().onTapAvatar(member);
          },
        );

        if (isLastMessage && state.statusLoadNextPage.isLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const XIndicator(radius: 11),
              const SizedBox(height: 8),
              if (timeWidget != null) timeWidget,
              itemWidget,
            ],
          );
        }
        if (timeWidget != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              timeWidget,
              itemWidget,
            ],
          );
        }
        return itemWidget;
      },
    );
  }

  bool showTimeDay(int index, List<MChatMessage> messages) {
    return (index + 1) >= messages.length ||
        messages[index].updatedAt.toDate().day !=
            messages[index + 1].updatedAt.toDate().day;
  }

  bool showAvatar(String currentId, int index, List<MChatMessage> messages) {
    if (messages[index].idUserFrom == currentId) {
      return false;
    }
    if (index == 0) {
      return true;
    }
    if (messages[index - 1].idUserFrom == currentId) {
      return true;
    }
    bool preMessageShowTime = showTimeDay(index - 1, messages);
    return preMessageShowTime;
  }
}
