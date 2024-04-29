import 'dart:ui';

import 'package:flutter/material.dart';

import '../Widgets/course_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFC246BE),

          centerTitle: true,
          title: const Text(
            'كورساتي ',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Ffshamel',
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.of(context).pop();
              }
            },
          ),
          elevation: 0, // Remove the elevation for a flat appearance
          // You can also add more properties like leading, actions, etc. for additional functionality
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'أهلا بعودتك ، حمدي !',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Ffshamel',
                      color: Colors.black),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'استكشف كورساتك',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Ffshamel',
                    color: Color(0xFFC246BE),
                  ),
                ),
                const SizedBox(height: 16.0),
                CourseCard(
                  courseName: 'تطوير تطبيقات الموبايل بإستخدام فلاتر',
                  instructor: ' حمدي حجاج',
                  image: 'assets/images/f.png', // Add your image asset
                  rating: 4.9,
                  lessons: 15,
                  onPress: () {
                    // Add functionality for when this course card is pressed
                  },
                ),
                const SizedBox(height: 16.0),
                CourseCard(
                  courseName: 'أساسيات تعديل الفيديو',
                  instructor: 'محمد الفهلوي',
                  image: 'assets/images/v.jpeg',
                  rating: 5.0,
                  lessons: 12,
                  onPress: () {
                    // Add functionality for when this course card is pressed
                  },
                ),
                const SizedBox(height: 16.0),

                CourseCard(
                  courseName: 'كورس تطوير المواقع ',
                  instructor: 'محمد اللقاني',
                  image: 'assets/images/w.jpg',
                  rating: 4.9,
                  lessons: 12,
                  onPress: () {
                    // Add functionality for when this course card is pressed
                  },
                ),
                // Add more CourseCard widgets for other courses
              ],
            ),
          ),
        ),
      ),
    );
  }
}
