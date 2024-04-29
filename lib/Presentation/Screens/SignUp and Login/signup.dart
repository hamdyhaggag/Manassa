import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:manassa/Presentation/Screens/SignUp%20and%20Login/log-in.dart';

import '../../Widgets/custom_appbar.dart';
import '../../Widgets/custom_buttom.dart';
import '../../Widgets/custom_text-field.dart';
import '../../Widgets/navigator.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  bool _isCheckboxChecked = false;
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
          title: ' حساب جديد ',
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: 'الاسم الكامل ',
                  obscureText: false,
                  toggleVisibility: () {},
                ),
                CustomTextField(
                  hintText: 'البريد الإلكتروني',
                  obscureText: false,
                  toggleVisibility: () {},
                ),
                CustomTextField(
                  hintText: 'كلمة المرور',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  toggleVisibility: _togglePasswordVisibility,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 35.0, top: 15.0, right: 20),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isCheckboxChecked,
                        activeColor: const Color(0xFFC246BE),
                        onChanged: (newValue) {
                          setState(() {
                            _isCheckboxChecked = newValue ?? false;
                          });
                        },
                      ),
                      Flexible(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'من خلال إنشاء حساب فإنك توافق على ',
                                style: TextStyle(
                                  fontFamily: 'GESS',
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: 'الشروط و الأحكام',
                                style: TextStyle(
                                  fontFamily: 'GESS',
                                  fontSize: 14,
                                  color: Color(0xFFC246BE),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(
                                text: ' الخاصة بنا',
                                style: TextStyle(
                                  fontFamily: 'GESS',
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CustomElevatedButton(
                  text: 'إنشاء حساب جديد',
                  onPressed: () {},
                ),
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    text: ' تمتلك حساب بالفعل؟ ',
                    style: const TextStyle(
                        fontFamily: 'GESS',
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w900),
                    children: <TextSpan>[
                      TextSpan(
                          text: '  تسجيل الدخول',
                          style: const TextStyle(
                              fontFamily: 'GESS',
                              fontSize: 14,
                              color: Color(0xFFC246BE),
                              fontWeight: FontWeight.w900),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigateAndFinish(context, LogInScreen());
                            }),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
