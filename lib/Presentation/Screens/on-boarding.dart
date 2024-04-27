import 'package:flutter/material.dart';
import 'package:manassa/Presentation/Screens/sign-in.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 2,
            itemBuilder: (context, index) {
              return OnboardingPage(
                index: index,
              );
            },
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_pageController.page == 0) {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>   SignInScreen( ),
                      ),
                    );                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC246BE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fixedSize: const Size(231, 57),
                ),
                child: const Text(
                  'التالي',
                  style: TextStyle(
                    fontFamily: 'Ffshamel',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final int index;

  const OnboardingPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFEBFE),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/App Logo1.png',
            height: 50.94,
            width: 74.95,
          ),
          const SizedBox(height: 60),
          index == 0
              ? Image.asset(
            'assets/images/onboarding person 1.png',
            height: 300,
            width: 323.19,
          )
              : Image.asset(
            'assets/images/onboarding person 2.png',
            height: 300,
            width: 323.19,
          ),
          const SizedBox(height: 30),
          Text(
            index == 0
                ? 'اجعل التعلم متاحاً \n في أي مكان'
                : 'قم بتمكين تجربة  \n التعلم الخاصة بك',
            style: const TextStyle(
              fontFamily: 'Ffshamel',
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 15),
          const SizedBox(
            height: 100,
            width: 270,
            child: Text(
              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة تماماً مثل ذلك يابرووو',
              style: TextStyle(
                fontFamily: 'Ffshamel',
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
