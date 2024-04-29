import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:manassa/Presentation/Screens/SignUp%20and%20Login/new_password.dart';

import '../../Widgets/custom_appbar.dart';
import '../../Widgets/custom_buttom.dart';
import '../../Widgets/navigator.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(title: ' التحقق من الرمز '),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'أدخل الرمز الذي أرسلناه إلى رقمك الذي أدخلته 201xxxxxxxxxx+',
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
            Center(
              child: OtpTextField(
                fieldWidth: 48.0,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                focusedBorderColor: const Color(0xFFC246BE),
                numberOfFields: 6, autoFocus: true,
                alignment: Alignment.centerLeft,
                borderColor: const Color(0xFFC246BE),
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  // handle validation or checks here
                },
                onSubmit: (String verificationCode) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Center(
                          child: Text(
                            "رمز التحقق ",
                            style: TextStyle(
                                fontFamily: 'GESS',
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        content: Text(
                          'رمز التحقق الذي أدخلته هو $verificationCode',
                          style: const TextStyle(
                            fontFamily: 'GESS',
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  );
                }, // end onSubmit
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomElevatedButton(
              text: 'تحقق من الرمز',
              onPressed: () {
                navigateAndFinish(context, const NewPasswordScreen());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              ' إعادة إرسال الرمز',
              style: TextStyle(
                fontFamily: 'GESS',
                fontSize: 18,
                color: Color(0xFFC246BE),
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
