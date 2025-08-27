import 'package:appp/constans.dart';
import 'package:appp/core/widget/custom_button.dart';
import 'package:appp/core/widget/custom_text_filed.dart';
import 'package:appp/generated/l10n.dart';
import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),

            CustomTextFormFiled(
              hinttext: S.of(context).enterEmail,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),

            CustomTextFormFiled(
              hinttext: S.of(context).enterPassword,
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.remove_red_eye_rounded,
                color: Color(0xFFCBCBD4),
              ),
            ),
            SizedBox(height: 16),
            Text(
              S.of(context).forgetPassword,
              style: AppStyles.styleRegular13.copyWith(
                color: AppColors.bgBrownLight,
              ),
            ),
            SizedBox(height: 30),
            CustomButton(onpressed: () {}, text: S.of(context).login),
            SizedBox(height: 30),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: S.of(context).dontHaveAccount,
                    style: AppStyles.styleRegular13,
                  ),
                  TextSpan(
                    text: S.of(context).signUp,
                    style: AppStyles.styleBold15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
