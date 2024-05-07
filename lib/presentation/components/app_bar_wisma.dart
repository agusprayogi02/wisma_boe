import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_starter/application/auth/auth_cubit.dart';

class AppBarWisma extends StatelessWidget implements PreferredSizeWidget {
  final String? namePage;
  final bool isHome;
  final List<Widget>? actions;
  final Widget? leading;

  const AppBarWisma({
    super.key,
    this.namePage,
    this.isHome = false,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(namePage ?? "Wisma VEDC"),
      automaticallyImplyLeading: true,
      leading: leading ??
          (isHome
              ? null
              : BackButton(
                  onPressed: () {
                    context.pop();
                  },
                )),
      actions: actions ??
          (isHome
              ? [
                  IconButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                    },
                    icon: const Icon(Icons.exit_to_app),
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                ]
              : null),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // default AppBar height
}
