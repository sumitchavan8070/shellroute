import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testinggetx/Components/home_page/profile_card.dart';
import 'package:testinggetx/Components/profile/profile_card.dart';
import 'package:testinggetx/Components/profile/profile_tabbar.dart';
import 'package:velocity_x/velocity_x.dart';

import 'constants/app_colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        elevation: 3,
        leading: Transform.scale(
          // scale: 0.8,
            scaleX: 1.0,
            scaleY: 1.2,
            child: InkWell(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset("assets/images/Registration/back.svg").pOnly(top: 0, left: 10, right: 10))),
        title: const Text(
          'Profile',
          style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 18),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            children: const [
              ProfileCard(),
              ProfileContainerCard(),
              ProfileTabbar(),
            ],
          ),
        ),
      ),
    );
  }
}
