import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginAppBar extends StatelessWidget with PreferredSizeWidget {
  const LoginAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 40,
      leading: Transform.scale(
          // scale: 0.8,
          scaleX: 1.0,
          scaleY: 1.2,
          child: InkWell(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset("assets/images/Registration/back.svg").pOnly(top: 25, left: 8))),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
