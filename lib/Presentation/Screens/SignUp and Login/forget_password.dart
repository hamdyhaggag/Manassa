import 'package:flutter/material.dart';
import 'package:manassa/Presentation/Screens/SignUp%20and%20Login/otp_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
            ' نسيان كلمة المرور ',
            style: TextStyle(
              fontFamily: 'Ffshamel',
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body:  Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'لا تقلق ، ما عليك سوى كتابة رقم هاتفك و سنرسل لك رمز التحقق',
                style: TextStyle(
                  fontFamily: 'GESS',
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 25,),
            Column(
              children: [
                _buildInputField(
                  hintText: 'رقم الهاتف',
                  obscureText: false,
                  toggleVisibility: () {},
                ),
                const SizedBox(height: 10,),
                _buildElevatedButton(
                  text: 'نسيت كلمة المرور',
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OtpScreen()),
                  );},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
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