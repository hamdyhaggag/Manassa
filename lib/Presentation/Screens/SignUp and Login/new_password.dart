import 'package:flutter/material.dart';
import '../../Widgets/custom_appbar.dart';
import '../../Widgets/custom_buttom.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
        appBar: const CustomAppBar(title: ' كلمة مرور جديدة '),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'قم بإنشاء كلمة مرور جديدة لتسجيل الدخول',
                    style: TextStyle(
                      fontFamily: 'GESS',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildInputField(
                  hintText: 'كلمة المرور',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  toggleVisibility: _togglePasswordVisibility,
                ),
                _buildInputField(
                  hintText: 'تأكيد كلمة المرور ',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  toggleVisibility: _togglePasswordVisibility,
                ),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  text: 'إنشاء كلمة مرور جديدة',
                  onPressed: () {},
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
}
