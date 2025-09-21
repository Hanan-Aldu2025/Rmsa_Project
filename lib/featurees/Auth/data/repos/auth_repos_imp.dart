import 'package:appp/core/error/Custom_Exception.dart';
import 'package:appp/core/error/failure.dart';
import 'package:appp/core/services/firebase_auth_services.dart';
import 'package:appp/featurees/Auth/data/models/User_Model.dart';
import 'package:appp/featurees/Auth/domain/entity/user_entity.dart';
import 'package:appp/featurees/Auth/domain/repos/auth_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthReposImp extends AuthRepos {
  final FirebaseAuthServices firebaseAuthServices;
  // ignore: unused_field
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthReposImp({required this.firebaseAuthServices});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String uId,
  ) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(FailureServer(e.message));
    } catch (_) {
      return left(FailureServer("An error: Please try again later"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(FailureServer(e.message));
    } catch (_) {
      return left(FailureServer("An error: Please try again later"));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendSignInLink(String email) async {
    final acs = ActionCodeSettings(
      url: 'https://rmsa-bc6bb.firebaseapp.com', // الرابط اللي يرجع له المستخدم
      handleCodeInApp: true, // مهم عشان يفتح التطبيق
      iOSBundleId: 'com.example.ios',
      androidPackageName: 'com.example.android',
      androidInstallApp: true,
      androidMinimumVersion: '12',
    );

    try {
      await FirebaseAuth.instance.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: acs,
      );
      print("📩 الرابط تم إرساله للبريد!");
      return right(unit); // نجاح العملية
    } catch (e) {
      print("❌ خطأ في إرسال الرابط: $e");
      return left(FailureServer(e.toString())); // فشل العملية
    }
  }
}
