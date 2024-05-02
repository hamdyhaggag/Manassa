import 'package:flutter/material.dart';
import 'package:manassa/Presentation/Screens/SignUp%20and%20Login/otp_screen.dart';

import '../../Widgets/custom_buttom.dart';
import '../../Widgets/custom_text-field.dart';
import '../../Widgets/navigator.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController phoneController = TextEditingController();
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
        body: Column(
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
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                CustomTextField(
                  hintText: 'رقم الهاتف',
                  obscureText: false,
                  toggleVisibility: () {},
                  controller: phoneController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                  text: 'نسيت كلمة المرور',
                  onPressed: () {
                    navigateAndFinish(context, const OtpScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
