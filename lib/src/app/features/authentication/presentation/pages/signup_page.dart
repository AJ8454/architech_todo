import 'package:architech_todo/src/app/features/authentication/domain/entities/user_entity.dart';
import 'package:architech_todo/src/app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:architech_todo/src/app/features/global/custom_drop_down_widget.dart';
import 'package:architech_todo/src/app/features/global/custom_rounded_button.dart';
import 'package:architech_todo/src/app/features/global/custom_text_form_field_widget.dart';
import 'package:architech_todo/src/app/features/global/snackbar_message.dart';
import 'package:architech_todo/src/core/responsive/app_responsive.dart';
import 'package:architech_todo/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const route = '/SignUp';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(AppResponsive.kdefaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppResponsive.height(context) * 0.10),
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
                    CustomTextFormField(
                      controller: userNameController,
                      labelText: "Username",
                      hintText: "Enter Username",
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: emailController,
                      labelText: "Email",
                      hintText: "Enter Email",
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: fNameController,
                            labelText: "First Name",
                            hintText: "Enter First Name",
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextFormField(
                            controller: lNameController,
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
                      selectedReturnValue: (value) {
                        selectedGender = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: passwordController,
                      labelText: "Password",
                      hintText: "Enter Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      labelText: "Confirm Password",
                      hintText: "Enter Confirm Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: CustomRoundedButtonWidget(
                        child: const Text("SignUp"),
                        onClicked: () {
                          UserEntity userEntity = UserEntity(
                            username: userNameController.text,
                            email: emailController.text,
                            password: confirmPasswordController.text,
                            firstName: fNameController.text,
                            lastName: lNameController.text,
                            gender: selectedGender,
                            image: "",
                            createdAt: DateTime.now(),
                          );
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(SignUpEvent(userEntity));
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is AuthFailureState) {
            SnackBarMessage()
                .showErrorSnackBar(message: state.error, context: context);
          }
          if (state is AuthLoadedState) {
            SnackBarMessage().showErrorSnackBar(
                message: "User Created Successfully", context: context);
          }
        },
      ),
    );
  }
}
