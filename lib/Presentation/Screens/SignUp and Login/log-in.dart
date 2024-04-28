import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:manassa/Presentation/Screens/SignUp%20and%20Login/forget_password.dart';
import 'package:manassa/Presentation/Screens/SignUp%20and%20Login/signup.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isPasswordVisible = false;
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
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'تسجيل الدخول',
            style: TextStyle(
              fontFamily: 'Ffshamel',
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildInputField(
                  hintText: 'البريد الإلكتروني',
                  obscureText: false,
                  toggleVisibility: () {},
                ),
                _buildInputField(
                  hintText: 'كلمة المرور',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  toggleVisibility: _togglePasswordVisibility,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgetPasswordScreen()),
                    );
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
                _buildElevatedButton(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()),
                              );
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

  Widget _buildInputField({
    required String hintText,
    required bool obscureText,
    IconData? suffixIcon,
    required VoidCallback toggleVisibility,
  }) {
    return Theme(
      data: ThemeData(
        // Define the default color for suffix icons
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.grey.shade400,
        ),
      ),
      child: Container(
        width: 327,
        height: 56,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(
                fontFamily: 'GESS',
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon, color: Colors.grey.shade400),
                    onPressed: toggleVisibility,
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFC246BE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        fixedSize: const Size(327, 56),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Ffshamel',
          fontSize: 18,
          color: Colors.white,
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
