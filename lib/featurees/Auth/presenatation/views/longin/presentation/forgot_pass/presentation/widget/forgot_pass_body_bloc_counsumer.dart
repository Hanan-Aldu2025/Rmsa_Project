import 'package:appp/featurees/Auth/presenatation/cubits/forgot_pass_cubit/forgot_pass_cubit.dart';
import 'package:appp/featurees/Auth/presenatation/cubits/forgot_pass_cubit/forgot_pass_state.dart';
import 'package:appp/featurees/Auth/presenatation/views/longin/presentation/forgot_pass/presentation/widget/forgot_pass_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgotPassBodyBlocConsumer extends StatelessWidget {
  const ForgotPassBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPassCubit, ForgotPassState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password reset link sent successfully ✅")),
          );
          Navigator.pop(context); // يرجع للشاشة السابقة بعد النجاح
        } else if (state is ForgotPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ForgotPasswordLoading,
          child: const ForgotPasswordBody(),
        );
      },
    );
  }
}