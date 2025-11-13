import 'package:firebase_auth/firebase_auth.dart';

final ActionCodeSettings acs = ActionCodeSettings(
  url: 'https://rmsa-bc6bb.firebaseapp.com', // ✅ استخدمي دومين مشروعك
  handleCodeInApp: true,
  iOSBundleId: 'com.example.ios',
  androidPackageName: 'com.example.android',

  androidInstallApp: true,
  androidMinimumVersion: '12',
);
