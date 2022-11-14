import 'package:flutter/material.dart';
import '/core/theme/laf_colors.dart';

class LAFAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const keyPrefix = 'AppBar';

  final String titleText;

  final Widget? leading;

  final List<Widget>? actions;

  final bool automaticallyImplyLeading;

  const LAFAppBar({
    Key? key,
    this.titleText = '',
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: LAFColors.ltLightGrayColor,
      color: LAFColors.ltWhiteColor,
      child: AppBar(
        // ? workaround to ensure title text is always centered.
        // Defining a `leading` widget limits the available space and offsets center.
        flexibleSpace: SafeArea(
          child: SizedBox(
            height: preferredSize.height,
            child: Center(
              child: Text(
                titleText,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: leading == null &&
                automaticallyImplyLeading &&
                Navigator.canPop(context)
            ? IconButton(
                key: const Key('$keyPrefix-leadingButton'),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                ),
              )
            : leading,
        actions: actions,
        //backgroundColor: backgroundColor,
      ),
    );
  }
}
