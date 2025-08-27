import 'package:appp/core/widget/custom_app_bar.dart';
import 'package:appp/featurees/longin/presentation/widget/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = "LoginView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Login'),
      body: const LoginViewBody(),
    );
  }
}
