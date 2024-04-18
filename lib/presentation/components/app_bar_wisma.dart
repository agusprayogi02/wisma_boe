import 'package:flutter/material.dart';

class AppBarWisma extends StatelessWidget implements PreferredSizeWidget {
  final String? namePage;
  const AppBarWisma({super.key, this.namePage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(namePage ?? "Wisma VEDC"),
      automaticallyImplyLeading: true,
      leading: BackButton(onPressed: () {
        Navigator.pushReplacementNamed(context, "/head/home");
      }),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/login");
          },
          icon: const Icon(Icons.logout_outlined),
          alignment: AlignmentDirectional.centerEnd,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // default AppBar height
}
