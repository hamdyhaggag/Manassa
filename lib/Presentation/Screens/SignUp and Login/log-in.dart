import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:manassa/Presentation/Screens/SignUp%20and%20Login/forget_password.dart';
import 'package:manassa/Presentation/Screens/SignUp%20and%20Login/signup.dart';

import '../../Widgets/custom_appbar.dart';
import '../../Widgets/custom_buttom.dart';
import '../../Widgets/custom_text-field.dart';
import '../../Widgets/navigator.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isPasswordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: ' تسجيل الدخول ',
          isHome: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: 'البريد الإلكتروني',
                  obscureText: false,
                  toggleVisibility: () {},
                  controller: emailController,
                ),
                CustomTextField(
                  hintText: 'كلمة المرور',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  toggleVisibility: _togglePasswordVisibility,
                  controller: passwordController,
                ),
                GestureDetector(
                  onTap: () {
                    navigateAndFinish(context, const ForgetPasswordScreen());
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 35.0, top: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'نسيت كلمة المرور ؟',
                        style: TextStyle(
                          fontFamily: 'Ffshamel',
                          fontSize: 16,
                          color: Color(0xFFC246BE),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomElevatedButton(
                  text: 'تسجيل الدخول',
                  onPressed: () {},
                ),
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    text: 'لا تمتلك حساب ؟ ',
                    style: const TextStyle(
                      fontFamily: 'Ffshamel',
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '  قم بإنشاء حساب',
                          style: const TextStyle(
                            fontFamily: 'Ffshamel',
                            fontSize: 12,
                            color: Color(0xFFC246BE),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigateAndFinish(context, SignUpScreen());
                            }),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35.0),
                        height: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      'أو',
                      style: TextStyle(
                        fontFamily: 'Ffshamel',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35.0),
                        height: 1.0,
                        color: Colors.grey, // Color of the line
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    _buildLoginMethodButton(
                      text: 'تسجيل الدخول باستخدام جوجل',
                      onPressed: () {
                        // Implement Google sign-in functionality here
                      },
                      suffixIcon: Image.asset(
                        'assets/images/google.png',
                        width: 16.85,
                        height: 19.98,
                      ),
                    ),
                    _buildLoginMethodButton(
                      text: 'تسجيل الدخول باستخدام أبل',
                      onPressed: () {},
                      suffixIcon: Image.asset(
                        'assets/images/apple.png',
                        width: 16.85,
                        height: 19.98,
                      ),
                    ),
                    _buildLoginMethodButton(
                      text: 'تسجيل الدخول باستخدام فيسبوك',
                      onPressed: () {},
                      suffixIcon: Image.asset(
                        'assets/images/facebook.png',
                        width: 16.85,
                        height: 19.98,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginMethodButton({
    required String text,
    required VoidCallback onPressed,
    required Widget suffixIcon,
  }) {
    return Container(
      width: 327,
      height: 56,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 15,
            ),
            suffixIcon,
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Ffshamel',
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
