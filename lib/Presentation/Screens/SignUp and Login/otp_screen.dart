import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

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
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            ' التحقق من الرمز   ',
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
            _buildElevatedButton(
              text: 'تحقق من الرمز',
              onPressed: () {},
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
