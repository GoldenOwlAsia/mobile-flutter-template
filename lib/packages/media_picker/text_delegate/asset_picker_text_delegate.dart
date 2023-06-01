// Copyright 2019 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by an Apache license that can be found
// in the LICENSE file.

import 'package:wechat_assets_picker/wechat_assets_picker.dart';

// France
// Korea
// Japan
// Thailand

/// [AssetPickerTextDelegate] implements with France.
class FranceAssetPickerTextDelegate extends AssetPickerTextDelegate {
  const FranceAssetPickerTextDelegate();
  @override
  String get languageCode => 'fr';

  @override
  String get confirm => 'Confirmer';

  @override
  String get cancel => 'Annuler';

  @override
  String get edit => 'Modifier';

  @override
  String get gifIndicator => 'GIF';

  @override
  String get loadFailed => 'Échec du chargement';

  @override
  String get original => 'Original';

  @override
  String get preview => 'Aperçu';

  @override
  String get select => 'Sélectionner';

  @override
  String get emptyList => 'Liste vide';

  @override
  String get unSupportedAssetType => 'Type de fichier HEIC non pris en charge.';

  @override
  String get unableToAccessAll =>
      "Impossible d'accéder à tous les fichiers sur l'appareil";

  @override
  String get viewingLimitedAssetsTip =>
      "Afficher uniquement les fichiers et les albums accessibles à l'application.";

  @override
  String get changeAccessibleLimitedAssets =>
      'Cliquez pour mettre à jour les fichiers accessibles';

  @override
  String get accessAllTip =>
      "L'application peut uniquement accéder à certains fichiers sur l'appareil. Accédez aux paramètres du système et autorisez l'application à accéder à tous les fichiers sur l'appareil.";

  @override
  String get goToSystemSettings => 'Accéder aux paramètres du système';

  @override
  String get accessLimitedAssets => 'Continuer avec un accès limité';

  @override
  String get accessiblePathName => 'Fichiers accessibles';

  @override
  String get sTypeAudioLabel => 'Audio';

  @override
  String get sTypeImageLabel => 'Image';

  @override
  String get sTypeVideoLabel => 'Vidéo';

  @override
  String get sTypeOtherLabel => 'Autre fichier';

  @override
  String get sActionPlayHint => 'Lecture';

  @override
  String get sActionPreviewHint => 'Aperçu';

  @override
  String get sActionSelectHint => 'Sélection';

  @override
  String get sActionSwitchPathLabel => 'Changer de chemin';

  @override
  String get sActionUseCameraHint => "Utiliser l'appareil photo";

  @override
  String get sNameDurationLabel => 'Durée';

  @override
  String get sUnitAssetCountLabel => 'Nombre';
}

/// [AssetPickerTextDelegate] implements with Korea.
class KoreaAssetPickerTextDelegate extends AssetPickerTextDelegate {
  const KoreaAssetPickerTextDelegate();
  @override
  String get languageCode => 'ko';

  @override
  String get confirm => '확인';

  @override
  String get cancel => '취소';

  @override
  String get edit => '편집';

  @override
  String get gifIndicator => 'GIF';

  @override
  String get loadFailed => '로드 실패';

  @override
  String get original => '원본';

  @override
  String get preview => '미리보기';

  @override
  String get select => '선택';

  @override
  String get emptyList => '빈 목록';

  @override
  String get unSupportedAssetType => '지원되지 않는 HEIC 파일 형식입니다.';

  @override
  String get unableToAccessAll => '장치의 모든 자원에 액세스할 수 없습니다';

  @override
  String get viewingLimitedAssetsTip => '앱에서 액세스 가능한 자원과 앨범만 표시됩니다.';

  @override
  String get changeAccessibleLimitedAssets => '액세스 가능한 자원을 업데이트하려면 클릭하세요';

  @override
  String get accessAllTip => '앱은 장치의 일부 자원에만 액세스할 수 있습니다. '
      '시스템 설정으로 이동하여 앱이 장치의 모든 자원에 액세스할 수 있도록 허용하세요.';

  @override
  String get goToSystemSettings => '시스템 설정으로 이동';

  @override
  String get accessLimitedAssets => '제한된 액세스로 계속';

  @override
  String get accessiblePathName => '액세스 가능한 자원';

  @override
  String get sTypeAudioLabel => '오디오';

  @override
  String get sTypeImageLabel => '이미지';

  @override
  String get sTypeVideoLabel => '비디오';

  @override
  String get sTypeOtherLabel => '기타 자원';

  @override
  String get sActionPlayHint => '재생';

  @override
  String get sActionPreviewHint => '미리보기';

  @override
  String get sActionSelectHint => '선택';

  @override
  String get sActionSwitchPathLabel => '경로 변경';

  @override
  String get sActionUseCameraHint => '카메라 사용';

  @override
  String get sNameDurationLabel => '지속 시간';

  @override
  String get sUnitAssetCountLabel => '개';
}

/// [AssetPickerTextDelegate] implements with Japan.
class JapanAssetPickerTextDelegate extends AssetPickerTextDelegate {
  const JapanAssetPickerTextDelegate();
  @override
  String get languageCode => 'ja';

  @override
  String get confirm => '確認';

  @override
  String get cancel => 'キャンセル';

  @override
  String get edit => '編集';

  @override
  String get gifIndicator => 'GIF';

  @override
  String get loadFailed => '読み込みに失敗しました';

  @override
  String get original => '元のファイル';

  @override
  String get preview => 'プレビュー';

  @override
  String get select => '選択';

  @override
  String get emptyList => 'リストは空です';

  @override
  String get unSupportedAssetType => 'サポートされていないHEICファイル形式です。';

  @override
  String get unableToAccessAll => 'デバイス上のすべてのファイルにアクセスできません';

  @override
  String get viewingLimitedAssetsTip => 'アプリケーションからアクセス可能なファイルとアルバムのみ表示されます。';

  @override
  String get changeAccessibleLimitedAssets => 'アクセス可能なファイルを更新するにはクリックしてください';

  @override
  String get accessAllTip => 'アプリケーションはデバイス上の一部のファイルにのみアクセスできます。'
      'システム設定に移動し、アプリケーションがデバイス上のすべてのファイルにアクセスできるように許可してください。';

  @override
  String get goToSystemSettings => 'システム設定に移動';

  @override
  String get accessLimitedAssets => '制限付きアクセスで続行';

  @override
  String get accessiblePathName => 'アクセス可能なファイル';

  @override
  String get sTypeAudioLabel => 'オーディオ';

  @override
  String get sTypeImageLabel => '画像';

  @override
  String get sTypeVideoLabel => 'ビデオ';

  @override
  String get sTypeOtherLabel => 'その他のファイル';

  @override
  String get sActionPlayHint => '再生';

  @override
  String get sActionPreviewHint => 'プレビュー';

  @override
  String get sActionSelectHint => '選択';

  @override
  String get sActionSwitchPathLabel => 'パスの切り替え';

  @override
  String get sActionUseCameraHint => 'カメラを使用する';

  @override
  String get sNameDurationLabel => '再生時間';

  @override
  String get sUnitAssetCountLabel => '個';
}

/// [AssetPickerTextDelegate] implements with Thailand.
class ThailandAssetPickerTextDelegate extends AssetPickerTextDelegate {
  const ThailandAssetPickerTextDelegate();

  @override
  String get languageCode => 'th';

  @override
  String get confirm => 'ยืนยัน';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get edit => 'แก้ไข';

  @override
  String get gifIndicator => 'GIF';

  @override
  String get loadFailed => 'โหลดไม่สำเร็จ';

  @override
  String get original => 'ต้นฉบับ';

  @override
  String get preview => 'ดูตัวอย่าง';

  @override
  String get select => 'เลือก';

  @override
  String get emptyList => 'รายการว่างเปล่า';

  @override
  String get unSupportedAssetType => 'รูปแบบไฟล์ที่ไม่รองรับ';

  @override
  String get unableToAccessAll => 'ไม่สามารถเข้าถึงทรัพยากรทั้งหมดได้';

  @override
  String get viewingLimitedAssetsTip =>
      'แสดงเฉพาะทรัพยากรและอัลบั้มที่สามารถเข้าถึงได้ผ่านแอป';

  @override
  String get changeAccessibleLimitedAssets =>
      'คลิกเพื่ออัปเดตทรัพยากรที่สามารถเข้าถึงได้';

  @override
  String get accessAllTip =>
      'แอปพลิเคชันสามารถเข้าถึงบางทรัพยากรบนอุปกรณ์ได้เท่านั้น. '
      'เข้าสู่การตั้งค่าระบบและอนุญาตให้แอปพลิเคชันเข้าถึงทรัพยากรทั้งหมดบนอุปกรณ์';

  @override
  String get goToSystemSettings => 'ไปที่การตั้งค่าระบบ';

  @override
  String get accessLimitedAssets => 'ดำเนินการต่อเพียงสามารถเข้าถึงได้จำกัด';

  @override
  String get accessiblePathName => 'ทรัพยากรที่สามารถเข้าถึงได้';

  @override
  String get sTypeAudioLabel => 'ไฟล์เสียง';

  @override
  String get sTypeImageLabel => 'รูปภาพ';

  @override
  String get sTypeVideoLabel => 'วิดีโอ';

  @override
  String get sTypeOtherLabel => 'ไฟล์อื่น ๆ';

  @override
  String get sActionPlayHint => 'เล่น';

  @override
  String get sActionPreviewHint => 'ดูตัวอย่าง';

  @override
  String get sActionSelectHint => 'เลือก';

  @override
  String get sActionSwitchPathLabel => 'เปลี่ยนทาง';

  @override
  String get sActionUseCameraHint => 'ใช้กล้อง';

  @override
  String get sNameDurationLabel => 'ระยะเวลา';

  @override
  String get sUnitAssetCountLabel => 'จำนวน';
}
