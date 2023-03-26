import 'package:architech_todo/src/app/features/global/custom_drop_down_widget.dart';
import 'package:architech_todo/src/app/features/global/custom_rounded_button.dart';
import 'package:architech_todo/src/app/features/global/custom_text_form_field_widget.dart';
import 'package:architech_todo/src/core/responsive/app_responsive.dart';
import 'package:architech_todo/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static const route = '/SignUp';

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
              const SizedBox(height: 25),
              Text(
                "Sign Up",
                style: AppResponsive.responsiveTextStyle(
                  context,
                  fsize: AppResponsive.kmaxExtraLargeFont(context) + 10,
                  fweight: FontWeight.bold,
                  tColor: AppColor.blue,
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                labelText: "Username",
                hintText: "Enter Username",
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                labelText: "Email",
                hintText: "Enter Email",
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(
                    child: CustomTextFormField(
                      labelText: "First Name",
                      hintText: "Enter First Name",
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormField(
                      labelText: "Last Name",
                      hintText: "Enter Last Name",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomDropDownWidget(
                dropMenuList: const ["Male", "Female", "Other"],
                labelText: "Gender",
                hintText: "Select Gender",
                selectedReturnValue: (value) {},
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                labelText: "Password",
                hintText: "Enter Password",
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                labelText: "Confirm Password",
                hintText: "Enter Confirm Password",
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CustomRoundedButtonWidget(
                  child: const Text("SignUp"),
                  onClicked: () {},
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
