// Copyright 2019 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by an Apache license that can be found
// in the LICENSE file.

import 'package:wechat_camera_picker/wechat_camera_picker.dart';

// France
// Korea
// Japan
// Thailand

/// Text delegate implements with France.
class FranceCameraPickerTextDelegate extends CameraPickerTextDelegate {
  const FranceCameraPickerTextDelegate();
  @override
  String get languageCode => 'fr';

  @override
  String get confirm => 'Confirmer';

  @override
  String get shootingTips => 'Appuyez pour prendre une photo.';

  @override
  String get shootingWithRecordingTips =>
      'Appuyez pour prendre une photo. Maintenez enfoncé pour enregistrer une vidéo.';

  @override
  String get shootingOnlyRecordingTips =>
      'Maintenez enfoncé pour enregistrer une vidéo.';

  @override
  String get shootingTapRecordingTips => 'Appuyez pour enregistrer une vidéo.';

  @override
  String get loadFailed => 'Échec du chargement';

  @override
  String get loading => 'Chargement en cours...';

  @override
  String get saving => 'Enregistrement en cours...';

  @override
  String get sActionManuallyFocusHint => 'Mise au point manuelle';

  @override
  String get sActionPreviewHint => 'Aperçu';

  @override
  String get sActionRecordHint => 'Enregistrer';

  @override
  String get sActionShootHint => 'Prendre une photo';

  @override
  String get sActionShootingButtonTooltip => 'Bouton de prise de vue';

  @override
  String get sActionStopRecordingHint => "Arrêter l'enregistrement";

  @override
  String sCameraLensDirectionLabel(CameraLensDirection value) => value.name;

  @override
  String? sCameraPreviewLabel(CameraLensDirection? value) {
    if (value == null) {
      return null;
    }
    return 'Aperçu de la caméra ${sCameraLensDirectionLabel(value)}';
  }

  @override
  String sFlashModeLabel(FlashMode mode) => 'Mode Flash : ${mode.name}';

  @override
  String sSwitchCameraLensDirectionLabel(CameraLensDirection value) =>
      'Passer à la caméra ${sCameraLensDirectionLabel(value)}';
}

/// Text delegate implements with Korea.
class KoreaCameraPickerTextDelegate extends CameraPickerTextDelegate {
  const KoreaCameraPickerTextDelegate();
  @override
  String get languageCode => 'ko';

  @override
  String get confirm => '확인';

  @override
  String get shootingTips => '사진을 찍으려면 탭하세요.';

  @override
  String get shootingWithRecordingTips => '사진을 찍으려면 탭하세요. 비디오를 녹화하려면 길게 누르세요.';

  @override
  String get shootingOnlyRecordingTips => '비디오를 녹화하려면 길게 누르세요.';

  @override
  String get shootingTapRecordingTips => '비디오를 녹화하려면 탭하세요.';

  @override
  String get loadFailed => '로드 실패';

  @override
  String get loading => '로딩 중...';

  @override
  String get saving => '저장 중...';

  @override
  String get sActionManuallyFocusHint => '수동 초점 맞추기';

  @override
  String get sActionPreviewHint => '미리보기';

  @override
  String get sActionRecordHint => '녹화';

  @override
  String get sActionShootHint => '사진 촬영';

  @override
  String get sActionShootingButtonTooltip => '촬영 버튼';

  @override
  String get sActionStopRecordingHint => '녹화 중지';

  @override
  String sCameraLensDirectionLabel(CameraLensDirection value) => value.name;

  @override
  String? sCameraPreviewLabel(CameraLensDirection? value) {
    if (value == null) {
      return null;
    }
    return '${sCameraLensDirectionLabel(value)} 카메라 미리보기';
  }

  @override
  String sFlashModeLabel(FlashMode mode) => '플래시 모드: ${mode.name}';

  @override
  String sSwitchCameraLensDirectionLabel(CameraLensDirection value) =>
      '${sCameraLensDirectionLabel(value)} 카메라로 전환';
}

/// Text delegate implements with Japan.
class JapanCameraPickerTextDelegate extends CameraPickerTextDelegate {
  const JapanCameraPickerTextDelegate();
  @override
  String get languageCode => 'ja';

  @override
  String get confirm => '確認';

  @override
  String get shootingTips => '写真を撮るにはタップしてください。';

  @override
  String get shootingWithRecordingTips =>
      '写真を撮るにはタップしてください。ビデオを録画するには長押ししてください。';

  @override
  String get shootingOnlyRecordingTips => 'ビデオを録画するには長押ししてください。';

  @override
  String get shootingTapRecordingTips => 'ビデオを録画するにはタップしてください。';

  @override
  String get loadFailed => '読み込み失敗';

  @override
  String get loading => '読み込み中...';

  @override
  String get saving => '保存中...';

  @override
  String get sActionManuallyFocusHint => '手動でフォーカスする';

  @override
  String get sActionPreviewHint => 'プレビュー';

  @override
  String get sActionRecordHint => '録画';

  @override
  String get sActionShootHint => '写真を撮る';

  @override
  String get sActionShootingButtonTooltip => '撮影ボタン';

  @override
  String get sActionStopRecordingHint => '録画停止';

  @override
  String sCameraLensDirectionLabel(CameraLensDirection value) => value.name;

  @override
  String? sCameraPreviewLabel(CameraLensDirection? value) {
    if (value == null) {
      return null;
    }
    return '${sCameraLensDirectionLabel(value)} カメラプレビュー';
  }

  @override
  String sFlashModeLabel(FlashMode mode) => 'フラッシュモード: ${mode.name}';

  @override
  String sSwitchCameraLensDirectionLabel(CameraLensDirection value) =>
      '${sCameraLensDirectionLabel(value)} カメラに切り替える';
}

/// Text delegate implements with Thailand.
class ThailandCameraPickerTextDelegate extends CameraPickerTextDelegate {
  const ThailandCameraPickerTextDelegate();
  @override
  String get languageCode => 'th';

  @override
  String get confirm => 'ยืนยัน';

  @override
  String get shootingTips => 'แตะเพื่อถ่ายรูป';

  @override
  String get shootingWithRecordingTips =>
      'แตะเพื่อถ่ายรูป กดค้างเพื่อบันทึกวิดีโอ';

  @override
  String get shootingOnlyRecordingTips => 'กดค้างเพื่อบันทึกวิดีโอ';

  @override
  String get shootingTapRecordingTips => 'แตะเพื่อบันทึกวิดีโอ';

  @override
  String get loadFailed => 'โหลดไม่สำเร็จ';

  @override
  String get loading => 'กำลังโหลด...';

  @override
  String get saving => 'กำลังบันทึก...';

  @override
  String get sActionManuallyFocusHint => 'โฟกัสด้วยตนเอง';

  @override
  String get sActionPreviewHint => 'ดูตัวอย่าง';

  @override
  String get sActionRecordHint => 'บันทึก';

  @override
  String get sActionShootHint => 'ถ่ายรูป';

  @override
  String get sActionShootingButtonTooltip => 'ปุ่มถ่ายภาพ';

  @override
  String get sActionStopRecordingHint => 'หยุดการบันทึก';

  @override
  String sCameraLensDirectionLabel(CameraLensDirection value) => value.name;

  @override
  String? sCameraPreviewLabel(CameraLensDirection? value) {
    if (value == null) {
      return null;
    }
    return 'ดูตัวอย่างกล้อง ${sCameraLensDirectionLabel(value)}';
  }

  @override
  String sFlashModeLabel(FlashMode mode) => 'โหมดแฟลช: ${mode.name}';

  @override
  String sSwitchCameraLensDirectionLabel(CameraLensDirection value) =>
      'สลับไปยังกล้อง ${sCameraLensDirectionLabel(value)}';
}
