import 'package:appp/constants/constans_kword.dart';
import 'package:appp/core/widget/custom_button.dart';
import 'package:appp/core/widget/custom_text_filed.dart';
import 'package:appp/featurees/Auth/presenatation/cubits/signup_cubit/signup_cubit.dart';
import 'package:appp/featurees/Auth/presenatation/views/signUp/presentation/widget/conditaions_widget.dart';
import 'package:appp/featurees/Auth/presenatation/views/signUp/presentation/widget/custom_password_filed.dart';
import 'package:appp/featurees/Auth/presenatation/views/signUp/presentation/widget/have_account.dart';
import 'package:appp/featurees/Auth/presenatation/views/signUp/presentation/widget/validators.dart';
import 'package:appp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool isTermsAccepted = false;

  // المتغيرات فقط لتخزين القيم
  String? email;
  String? userName;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),

              // Full Name Field
              CustomTextFormFiled(
                onSaved: (value) => userName = value,
                hinttext:  S.of(context).enterEmail,
                textInputType: TextInputType.name,
                validator: (value) => AuthValidators.name(value, context),
              ),
              const SizedBox(height: 16),

              // Email Field
              CustomTextFormFiled(
                onSaved: (value) => email = value,
                hinttext:  S.of(context).enterEmail,
                textInputType: TextInputType.emailAddress,
                validator: (value) => AuthValidators.email(value, context),
              ),
              const SizedBox(height: 16),

              // Password Field
              passwordFiled(onSaved: (value) => password = value),
              const SizedBox(height: 16),

              // Conditions Checkbox
              ConditaionsWidget(),
              const SizedBox(height: 16),
              //
              // Create Account Button
              CustomButton(
                onpressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // if (!isTermsAccepted) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text(
                    //         "You must accept terms and conditions.",
                    //       ),
                    //     ),
                    //   );
                    //   return; // إيقاف العملية إذا لم يوافق المستخدم
                    // }
                    // إذا كل شيء صحيح، استدعاء Cubit
                    context.read<SignupCubit>().createUserWithEmilAndPassword(
                      email!,
                      password!,
                      userName!,
                    );
                  } else {
                    setState(() => _autovalidateMode = AutovalidateMode.always);
                  }
                },
                text: S.of(context).create_new_account,
              ),
              const SizedBox(height: 16),

              // Already have account
              HaveAccount(context),
            ],
          ),
        ),
      ),
    );
  }
}
