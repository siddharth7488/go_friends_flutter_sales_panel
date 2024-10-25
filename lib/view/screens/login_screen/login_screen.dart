import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/constants/app_button.dart';
import 'package:gofreindsgo_sales/utils/constants/app_textfields.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/screen_padding.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
import 'package:gofreindsgo_sales/view_model/user_details.dart';
import 'package:provider/provider.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool _obscureText = true; // For password visibility toggle

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    // Show a popup for invalid login attempt
    void _showInvalidCredentialsMessage() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials. Please try again.')),
      );
    }

    return Scaffold(
      body: Padding(
        padding: commonScreenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizedBoxHeight(0.1),
                  const AppdecorText(
                    text: 'Login',
                    size: 0.08,
                    color: Colors.black,
                    weight: FontWeight.bold,
                  ),
                  const CustomSizedBoxHeight(0.04),
                  const CustomText(
                    fontFamily: CustomFonts.poppins,
                    text: 'Email Address',
                    size: 0.04,
                    color: Colors.black,
                  ),
                  Inputfield(
                    submitFun: (value) => null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }

                      final emailRegExp = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      );
                      if (!emailRegExp.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    controller: emailController,
                    hinttext: 'abc@gmail.com',
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  const CustomSizedBoxHeight(0.03),
                  const CustomText(
                    fontFamily: CustomFonts.poppins,
                    text: 'Password',
                    size: 0.04,
                    color: Colors.black,
                  ),
                  InputfieldLogin(
                    submitFun: (value) => null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    controller: passController,
                    hinttext: '* * * *',
                    obscureText: _obscureText, // Encrypt password text
                    prefixIcon: const Icon(Icons.lock_outline), // Correct icon
                    icon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const CustomSizedBoxHeight(0.02),
                CustomButton(
                  fontFamily: CustomFonts.poppins,
                  function: () {
                    if (loginFormKey.currentState!.validate()) {
                      userViewModel.loginUser(
                        emailController.text,
                        passController.text,
                      );
                    }
                  },
                  text: 'Log In',
                  fontSize: 0.04,
                  buttonTextColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
                const CustomSizedBoxHeight(0.04),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
