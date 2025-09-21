import 'package:appp/core/services/get_it_services.dart';
import 'package:appp/core/widget/custom_build_AppBarr.dart';
import 'package:appp/featurees/Auth/domain/repos/auth_repos.dart';
import 'package:appp/featurees/Auth/presenatation/cubits/signup_cubit/signup_cubit.dart';
import 'package:appp/featurees/Auth/presenatation/views/signUp/presentation/widget/custom_signup_body_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = "SignupView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<AuthRepos>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: "Sign Up"),
        body: SignupBodyBlocConsumer(),
      ),
    );
  }
}
