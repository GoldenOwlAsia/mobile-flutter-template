// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../../../../../packages/media_picker/media_picker.dart';
import '../../../../../../dialogs/toast_wrapper.dart';
import '../../../../../../localization/localization_utils.dart';
import '../../../../../../network/blob/model/upload_model.dart';
import '../../../../../../network/model/common/handle.dart';
import '../../../../../../network/model/common/result.dart';
import '../../../../../../services/permission_service.dart';
import '../../../../../account/logic/account_bloc.dart';
import '../../../../network/chat_domain.dart';
import '../../../../network/chat_upload_service.dart';
import '../../../../network/model/media/chat_media.dart';
import '../../../../network/model/message/chat_message.dart';
import '../../../../network/model/room/chat_room.dart';
import '../../widget/reaction/select_message.dart';
import '../../widget/reaction/select_reaction_dialog.dart';
import 'record_audio_state.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit(MChatRoom room) : super(SendMessageState.ds(room)) {
    initRecorder();
  }
  void onTextChange(String text) {
    emit(state.copyWith(contentMessage: text));
  }

  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  void initRecorder() async {
    await _recorder.openRecorder();
    _recorder.setSubscriptionDuration(const Duration(milliseconds: 1000));
    _recorder.onProgress?.listen((event) {
      emit(state.copyWith(
          recordAudio: state.recordAudio
              .copyWith(durationAudio: event.duration, isRecording: true)));
    });
  }

  @override
  Future<void> close() {
    _recorder.closeRecorder();
    return super.close();
  }

  Future uploadMediaAndSendMessage(List<AssetEntity>? assets) async {
    if (assets == null || assets.isEmpty) {
      return;
    }
    emit(state.copyWith(isUploadFiles: true));
    final List<MResult<MUpload>> uploadResults =
        await ChatUploadService.uploadAssetFiles(assets);

    emit(state.copyWith(isUploadFiles: false));

    final List<MChatMedia> medias = [];
    for (int i = 0; i < uploadResults.length; i++) {
      final MUpload? blob = uploadResults[i].data;
      if (uploadResults[i].isSuccess && blob != null) {
        medias.add(MChatMedia.fromAsset(assets[i], blob.url));
      }
    }
    if (medias.isEmpty) {
      XToast.error(S.text.error_upload_file_fail);
      return;
    }

    MChatMessage message = MChatMessage.newMediaMessage(
      medias,
      state.currentId,
      state.roomId,
      messageReply: state.messageReply,
    );
    return sendMessage(message);
  }

  Future sendTextMessage() async {
    final trimmedText = state.contentMessage.trim();
    if (trimmedText.isEmpty) {
      return;
    }
    MChatMessage message = MChatMessage.newTextMessage(
      state.contentMessage,
      state.currentId,
      state.roomId,
      messageReply: state.messageReply,
    );
    return sendMessage(message);
  }

  Future sendMessage(MChatMessage message) async {
    emit(state.copySendNewMessage());
    final messageResult =
        await ChatDomainManager().chatMessage.sendMessage(message);
    emit(state.copyWith(sendMessage: MHandle.result(messageResult)));
  }

  Future onClickCamera(BuildContext context) async {
    final AssetEntity? result = await XMediaPicker.pickOneFromCamera();
    if (result != null) {
      uploadMediaAndSendMessage([result]);
    }
  }

  Future onClickGallery(BuildContext context) async {
    final List<AssetEntity>? result =
        await XMediaPicker.pickMultipleFromAssets(maxAssets: 6);
    if (result != null) {
      uploadMediaAndSendMessage(result);
    }
  }

  Future onLongPressMessage(BuildContext context, MChatMessage message) async {
    final action = await showDialog<SelectMessage>(
      context: context,
      builder: (context) {
        return SelectReactionDialog(message);
      },
    );
    if (action != null) {
      switch (action.action) {
        case SelectMessageAction.reaction:
          message = message.addReaction(action.content, state.currentId);
          return ChatDomainManager().chatMessage.updateReactionList(message);
        case SelectMessageAction.reply:
          emit(state.copyWith(messageReply: message));
          break;
      }
    }
  }

  void onCancelReplyMessage() {
    emit(state.copyWith(messageReply: MChatMessage.empty()));
  }

  Future onChangeShowInputType(ShowInputType type) async {
    emit(state.copyWith(showInputType: type));
  }

  void toggleRecorder() async {
    final newType = state.showInputType == ShowInputType.recordAudio
        ? ShowInputType.node
        : ShowInputType.recordAudio;
    emit(state.copyWith(showInputType: newType));
  }

  void toggleInputEmoji() async {
    final newType = state.showInputType == ShowInputType.emoji
        ? ShowInputType.node
        : ShowInputType.emoji;
    emit(state.copyWith(showInputType: newType));
  }

  /// AUDIO
  ///
  Future uploadAudioAndSendMessage() async {
    await stopRecorder();
    final durationAudio = state.recordAudio.durationAudio;
    final path = state.recordAudio.pathAudio;
    cancelRecord();
    if (path.isEmpty) {
      return;
    }
    emit(state.copyWith(isUploadFiles: true));
    final MResult<MUpload> uploadResult =
        await ChatUploadService.uploadFile(path, AssetType.audio);
    emit(state.copyWith(isUploadFiles: false));

    if (uploadResult.isError) {
      XToast.error(S.text.error_upload_file_fail);
      return;
    }
    final blob = uploadResult.data!;
    final List<MChatMedia> medias = [
      MChatMedia(
        url: blob.url,
        fileType: MChatMediaType.audio,
        duration: durationAudio.inSeconds,
      ),
    ];

    MChatMessage message = MChatMessage.newMediaMessage(
      medias,
      state.currentId,
      state.roomId,
      messageReply: state.messageReply,
    );
    return sendMessage(message);
  }

  void startRecorder() async {
    var status = await PermissionService.requestMicrophonePermission();
    if (status) {
      if (_recorder.isPaused) {
        await _recorder.resumeRecorder();
      } else {
        await _recorder.startRecorder(toFile: 'audio');
      }
      emit(state.copyWith(
          recordAudio: state.recordAudio.copyWith(isRecording: true)));
    }
  }

  void pauseRecorder() async {
    _recorder.pauseRecorder();
    emit(state.copyWith(
        recordAudio: state.recordAudio.copyWith(isRecording: false)));
  }

  Future stopRecorder() async {
    String? path = '';
    if (_recorder.isRecording || _recorder.isPaused) {
      path = await _recorder.stopRecorder();
    }
    emit(state.copyWith(
        recordAudio:
            state.recordAudio.copyWith(pathAudio: path, isRecording: false)));
  }

  Future resetRecord() async {
    await _recorder.stopRecorder();
    return startRecorder();
  }

  void cancelRecord() {
    _recorder.stopRecorder();
    emit(
      state.copyWith(
        showInputType: ShowInputType.node,
        recordAudio: state.recordAudio.copyWith(
          pathAudio: '',
          durationAudio: Duration.zero,
          isRecording: false,
        ),
      ),
    );
  }
}
