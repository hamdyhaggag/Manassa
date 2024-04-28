import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:manassa/Presentation/Screens/SignUp%20and%20Login/log-in.dart';

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
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            ' حساب جديد ',
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
                  hintText: 'الاسم الكامل ',
                  obscureText: false,
                  toggleVisibility: () {},
                ),
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
                _buildElevatedButton(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogInScreen()),
                              );
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

  Widget _buildInputField({
    required String hintText,
    required bool obscureText,
    IconData? suffixIcon,
    required VoidCallback toggleVisibility,
  }) {
    return Theme(
      data: ThemeData(
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
          border: Border.all(color: Colors.grey),
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
}
