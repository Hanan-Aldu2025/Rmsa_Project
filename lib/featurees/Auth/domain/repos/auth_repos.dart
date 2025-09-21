import 'package:appp/core/error/failure.dart';
import 'package:appp/featurees/Auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepos {
  // إنشاء مستخدم بحساب وبريد وكلمة مرور
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  // تسجيل الدخول بحساب وبريد وكلمة مرور
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  // إرسال رابط تسجيل الدخول بالبريد (Email Link Sign-In)
  Future<Either<Failure, Unit>> sendSignInLink(String email);

  // ملاحظات: هنا ممكن تضيف بقية الدوال مثل OTP، إعادة تعيين كلمة المرور… إذا احتجتي لاحقًا
}