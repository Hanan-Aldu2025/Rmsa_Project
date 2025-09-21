import 'dart:math';
import 'package:appp/core/error/Custom_Exception.dart';

class OtpRemoteDataSourceImpl {
  // لتخزين OTP مؤقتًا (يمكن استبداله بـ Firestore أو Realtime DB)
  final Map<String, String> _otpStore = {};
  final Map<String, String> _tokenStore = {};

  // -------- إرسال OTP --------
  Future<void> sendOtp(String email) async {
    try {
      // توليد OTP عشوائي 6 أرقام
      final otp = (Random().nextInt(900000) + 100000).toString();
      _otpStore[email] = otp;

      // هنا يمكن استبداله بإرسال OTP عبر البريد أو SMS
      print("OTP for $email is $otp");

      // محاكاة delay الشبكة
      await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      throw CustomException(message: "Failed to send OTP.");
    }
  }

  // -------- التحقق من OTP --------
  Future<String> verifyOtp(String email, String otp) async {
    try {
      if (!_otpStore.containsKey(email)) {
        throw CustomException(message: "OTP not found. Please request again.");
      }
      if (_otpStore[email] != otp) {
        throw CustomException(message: "Invalid OTP.");
      }

      // عند التحقق، اصدر token مؤقت لتغيير كلمة المرور
      final token = "token_${DateTime.now().millisecondsSinceEpoch}";
      _tokenStore[email] = token;

      // حذف OTP بعد التحقق
      _otpStore.remove(email);

      await Future.delayed(Duration(milliseconds: 500));
      return token;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  // -------- تأكيد كلمة المرور الجديدة --------
  Future<void> confirmNewPassword(String email, String token, String newPassword) async {
    try {
      if (!_tokenStore.containsKey(email) || _tokenStore[email] != token) {
        throw CustomException(message: "Invalid or expired token.");
      }

      // هنا يمكن تحديث كلمة المرور في Firestore أو أي backend
      print("Password for $email updated to: $newPassword");

      // حذف token بعد الاستخدام
      _tokenStore.remove(email);

      await Future.delayed(Duration(milliseconds: 500));
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}