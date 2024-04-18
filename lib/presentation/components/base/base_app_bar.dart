import 'package:flutter/material.dart';

import '../../../common/extensions/context_extension.dart';
import '../../theme/theme.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool isBack;
  final bool automaticallyImplyLeading;
  final bool centerTitle;

  const BaseAppBar({
    super.key,
    this.title,
    this.actions,
    this.isBack = false,
    this.automaticallyImplyLeading = true,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? "",
        style: AppStyles.text16PxBold.copyWith(
          color: Colors.white,
        ),
      ),
      leading: isBack
          ? InkWell(
              onTap: () {
                context.route.pop();
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 24,
              ),
            )
          : null,
      centerTitle: centerTitle,
      backgroundColor: ColorTheme.primary,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
