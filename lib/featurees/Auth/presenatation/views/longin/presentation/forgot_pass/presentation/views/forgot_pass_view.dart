import 'package:appp/core/services/get_it_services.dart';
import 'package:appp/core/widget/custom_build_AppBarr.dart';
import 'package:appp/featurees/Auth/domain/repos/auth_repos.dart';
import 'package:appp/featurees/Auth/presenatation/cubits/forgot_pass_cubit/forgot_pass_cubit.dart';
import 'package:appp/featurees/Auth/presenatation/views/longin/presentation/forgot_pass/presentation/widget/forgot_pass_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});
  static const routeName = "ForgotPassView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPassCubit(getIt.get<AuthRepos>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'Forgot Password'),
        body: ForgotPasswordBody(),
      ),
    );
  }
}
