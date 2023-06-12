import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../packages/emoji_picker/emoji_picker.dart';
import '../../logic/chat_detail/chat_detail_cubit.dart';
import '../../logic/send_message/send_message_cubit.dart';
import 'audio_bar.dart';
import 'reply_message_bar.dart';

class ChatBottomBar extends StatefulWidget {
  const ChatBottomBar({super.key});

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  late final _inputFocusNode = FocusNode(
    onKeyEvent: (node, event) {
      if (event.physicalKey == PhysicalKeyboardKey.enter &&
          !HardwareKeyboard.instance.physicalKeysPressed.any(
            (el) => <PhysicalKeyboardKey>{
              PhysicalKeyboardKey.shiftLeft,
              PhysicalKeyboardKey.shiftRight,
            }.contains(el),
          )) {
        if (event is KeyDownEvent) {
          _handleSendPressed();
        }
        return KeyEventResult.handled;
      } else {
        return KeyEventResult.ignored;
      }
    },
  );

  bool _attachmentButtonVisible = true;
  bool _sendButtonVisible = false;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController();
    _handleSendButtonVisibilityModeChange();
    _inputFocusNode.addListener(() {
      setState(() {
        _attachmentButtonVisible = !_inputFocusNode.hasFocus;
        if (_inputFocusNode.hasFocus) {
          context
              .read<SendMessageCubit>()
              .onChangeShowInputType(ShowInputType.keyboard);
        }
      });
    });
  }

  @override
  void dispose() {
    _inputFocusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _handleSendButtonVisibilityModeChange() {
    _textController.removeListener(_handleTextControllerChange);
    _sendButtonVisible = _textController.text.trim() != '';
    _textController.addListener(_handleTextControllerChange);
  }

  void _handleSendPressed() {
    final trimmedText = _textController.text.trim();
    if (trimmedText != '') {
      context.read<SendMessageCubit>().sendTextMessage();
    }
  }

  void _handleTextControllerChange() {
    setState(() {
      _sendButtonVisible = _textController.text.trim() != '';
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => _inputFocusNode.requestFocus(),
        child: _inputBuilder(),
      );

  Widget _inputBuilder() {
    return BlocListener<SendMessageCubit, SendMessageState>(
      listenWhen: (p, c) => p.contentMessage != c.contentMessage,
      listener: (context, state) {
        if (_textController.text != state.contentMessage) {
          _textController.text = state.contentMessage;
        }
      },
      child: BlocBuilder<SendMessageCubit, SendMessageState>(
        builder: (context, state) {
          return Focus(
            autofocus: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.isUploadFiles)
                  LinearProgressIndicator(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor),
                if (state.messageReply.id.isNotEmpty)
                  ReplyMessageBar(
                      messageOwner:
                          state.replyOwnerNameOf(state.messageReply.idUserFrom),
                      message: state.messageReply,
                      onCancelReply: () => context
                          .read<SendMessageCubit>()
                          .onCancelReplyMessage(),
                      onClickReply: () => context
                          .read<ChatDetailCubit>()
                          .scrollToMessage(state.messageReply.id)),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildAttachment(context),
                      const SizedBox(width: 4),
                      Expanded(child: _buildInput(context)),
                      // isNormal => show audio
                      const SizedBox(width: 4),
                      if (_sendButtonVisible)
                        IconButton(
                          icon: const Icon(Icons.send_rounded),
                          onPressed: _handleSendPressed,
                        )
                      else
                        IconButton(
                          icon: const Icon(Icons.mic),
                          onPressed: () {
                            context.read<SendMessageCubit>().toggleRecorder();
                            FocusScope.of(context).unfocus();
                          },
                        ),
                    ],
                  ),
                ),
                _buildOtherInputWidget(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Container _buildInput(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 2,
            color: Colors.black.withOpacity(.1),
          ),
        ],
      ),
      child: TextField(
        controller: _textController,
        focusNode: _inputFocusNode,
        onChanged: context.read<SendMessageCubit>().onTextChange,
        autocorrect: true,
        enableSuggestions: true,
        maxLines: 5,
        minLines: 1,
        keyboardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          hintText: 'Message',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
          suffixIcon: IconButton(
              icon: const Icon(Icons.emoji_emotions_outlined),
              onPressed: () {
                FocusScope.of(context).unfocus();
                context.read<SendMessageCubit>().toggleInputEmoji();
              }),
        ),
      ),
    );
  }

  Row _buildAttachment(BuildContext context) {
    return Row(
      children: [
        if (_attachmentButtonVisible) ...[
          IconButton(
            icon: const Icon(Icons.camera_alt_rounded),
            onPressed: () =>
                context.read<SendMessageCubit>().onClickCamera(context),
          ),
          IconButton(
            icon: const Icon(Icons.photo),
            onPressed: () =>
                context.read<SendMessageCubit>().onClickGallery(context),
          ),
        ] else
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              setState(() {
                _attachmentButtonVisible = true;
              });
            },
          ),
      ],
    );
  }

  Widget _buildOtherInputWidget(BuildContext context) {
    return BlocBuilder<SendMessageCubit, SendMessageState>(
      buildWhen: (p, c) => p.showInputType != c.showInputType,
      builder: (context, state) {
        Widget child = const SizedBox();
        double height = 0;
        switch (state.showInputType) {
          case ShowInputType.emoji:
            child = XEmojiPicker(
              textEditingController: _textController,
              onEmojiSelected: (p0, p1) {
                context
                    .read<SendMessageCubit>()
                    .onTextChange(_textController.text);
              },
            );
            height = 300;
            break;
          case ShowInputType.recordAudio:
            child = const AudioBar();
            height = 120;
            break;
          default:
            break;
        }
        return AnimatedContainer(
          height: height,
          duration: const Duration(milliseconds: 200),
          child: SingleChildScrollView(
              child: SizedBox(height: height, child: child)),
        );
      },
    );
  }
}
