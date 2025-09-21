import 'package:appp/constants/constans_kword.dart';
import 'package:appp/core/widget/custom_button.dart';
import 'package:appp/featurees/Auth/presenatation/cubits/login_cubit/login_cubit.dart';
import 'package:appp/featurees/Auth/presenatation/views/longin/presentation/forgot_pass/presentation/views/forgot_pass_view.dart';
import 'package:appp/featurees/Auth/presenatation/views/longin/presentation/widget/custom_dont_have_account.dart';
import 'package:appp/core/widget/custom_text_filed.dart';
import 'package:appp/featurees/Auth/presenatation/views/longin/presentation/widget/custom_social_login_button.dart';
import 'package:appp/featurees/Auth/presenatation/views/signUp/presentation/widget/custom_password_filed.dart';
import 'package:appp/featurees/Auth/presenatation/views/signUp/presentation/widget/validators.dart';
import 'package:appp/generated/l10n.dart';
import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_images.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              children: [
                SizedBox(height: 24),

                CustomTextFormFiled(
                  onSaved: (value) => email = value,
                  hinttext: S.of(context).enterEmail,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => AuthValidators.email(value, context),
                ),
                SizedBox(height: 16),
                // Password Field
                passwordFiled(onSaved: (value) => password = value),
                SizedBox(height: 16),
                //________________________________________________//
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ForgotPassView()),
                    );
                  },
                  child: Align(
                    alignment: Directionality.of(context) == TextDirection.rtl
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                    child: Text(
                      S
                          .of(context)
                          .forgetPassword, // أو ForgotPassStrings.backToLoginAr حسب ما تستخدمي
                      style: AppStyles.styleRegular13.copyWith(
                        color: AppColors.bgBrownDark,
                      ),
                    ),
                  ),
                ),
                //_____________________________________________________//
                SizedBox(height: 30),
                CustomButton(
                  onpressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<LoginCubit>().signInWithEmailAndPassword(
                        email!,
                        password!,
                      );
                    } else {
                      setState(
                        () => _autovalidateMode = AutovalidateMode.always,
                      );
                    }
                  },
                  text: S.of(context).login,
                ),
                SizedBox(height: 15),

                dontHaveAccount(context),
                //_________________________________________//
                SizedBox(height: 16),
                CustomSocialLoginButton(
                  title: S.of(context).loginwithGoogle,
                  image: Image.asset(Assets.imagesGoogle),
                  onPressed: () {},
                ),
                SizedBox(height: 16),

                CustomSocialLoginButton(
                  title: S.of(context).loginwithIphone,
                  image: Image.asset(Assets.imagesIphon),
                  onPressed: () {},
                ),
                SizedBox(height: 16),

                CustomSocialLoginButton(
                  title: S.of(context).loginwithFacebook,
                  image: Image.asset(Assets.imagesFacebook),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
