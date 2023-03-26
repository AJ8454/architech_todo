import 'package:architech_todo/src/app/features/global/custom_rounded_button.dart';
import 'package:architech_todo/src/app/features/global/custom_text_form_field_widget.dart';
import 'package:architech_todo/src/core/responsive/app_responsive.dart';
import 'package:architech_todo/src/core/routes/app_navigator.dart';
import 'package:architech_todo/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  static const route = "/ForgetPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppResponsive.kdefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Text(
                "Forget Password",
                style: AppResponsive.responsiveTextStyle(
                  context,
                  fsize: AppResponsive.kmaxExtraLargeFont(context) + 10,
                  fweight: FontWeight.bold,
                  tColor: AppColor.blue,
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                labelText: "Email",
                hintText: "Enter Email",
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                labelText: "New Password",
                hintText: "Enter New Password",
                obscureText: true,
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                labelText: "Confirm Password",
                hintText: "Enter Confirm Password",
                obscureText: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CustomRoundedButtonWidget(
                  onClicked: () {},
                  child: const Text("Changed Password"),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    AppNavigator.pop(context);
                  },
                  child: const Text("Already have an account?  Login"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
