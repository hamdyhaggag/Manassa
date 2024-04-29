import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isHome;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isHome == false
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                }
              },
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Ffshamel',
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
