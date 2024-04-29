import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String courseName;
  final String instructor;
  final String image;
  final double rating;
  final int lessons;
  final Function onPress;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.instructor,
    required this.image,
    required this.rating,
    required this.lessons,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC246BE),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Text(
                      'جديد',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    courseName,
                    style: const TextStyle(
                      fontFamily: 'Ffshamel',
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'المدرب : $instructor',
                    style: TextStyle(
                      fontFamily: 'Ffshamel',
                      color: Colors.grey[700],
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20.0,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            '$rating',
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        ' عدد الدروس : $lessons ',
                        style: TextStyle(
                          fontFamily: 'Ffshamel',
                          color: Colors.grey[700],
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
