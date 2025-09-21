import 'package:appp/core/error/Custom_Exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ================== Email & Password ==================
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'The account already exists for that email');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: "The email address is badly formatted.");
      } else {
        throw CustomException(message: 'An error: Please try again later');
      }
    } catch (e) {
      throw CustomException(message: 'An error: Please try again later');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: "Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: "The email address is badly formatted.");
      } else {
        throw CustomException(message: 'An error: Please try again later');
      }
    } catch (e) {
      throw CustomException(message: 'An error: Please try again later');
    }
  }

  // ================== Email Link Sign-In ==================
  static const _emailKey = 'email_for_link_sign_in';

  Future<void> sendSignInLink(String email, ActionCodeSettings acs) async {
    try {
      await _auth.sendSignInLinkToEmail(email: email, actionCodeSettings: acs);
      await _saveEmail(email);
    } catch (e) {
      throw CustomException(message: 'Failed to send sign-in link.');
    }
  }

  Future<UserCredential> completeSignIn(String emailLink) async {
    final email = await _getEmail();
    if (email == null) throw CustomException(message: "Open the link on the same device.");
    try {
      final credential = await _auth.signInWithEmailLink(
        email: email,
        emailLink: emailLink,
      );
      await _clearEmail();
      return credential;
    } catch (e) {
      throw CustomException(message: 'Failed to complete sign-in.');
    }
  }

  // ================== Local Email Storage ==================
  Future<void> _saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
  }

  Future<String?> _getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  Future<void> _clearEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_emailKey);
  }
}