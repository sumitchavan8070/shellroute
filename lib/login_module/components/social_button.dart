import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../constants/app_colors.dart';

class SocaialButton extends StatelessWidget {
  const SocaialButton({super.key});

  @override
  Widget build(BuildContext context) {

    bool isAndroid = Platform.isAndroid;
    bool isIOS = Platform.isIOS;

    return SizedBox(
      height: 160,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width:MediaQuery.of(context).size.width * 0.23,child: Divider(color: Colors.grey.withOpacity(0.6), height: 5,thickness: 1,)),
              const Text("You can Connect with",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Heebo',
                  color: AppColors.subtitle,
                  fontWeight: FontWeight.w400,
                  height: 1.22,
                ),),
              SizedBox(width:MediaQuery.of(context).size.width * 0.23,child: Divider(color: Colors.grey.withOpacity(0.6), height: 5,thickness: 1,)),
            ],
          ),
          // const SizedBox(height: 10 ,),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.55 ,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appBar
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/Registration/fcaebook.svg",height: 30,width: 30),
                    ),
                  ).pSymmetric(h: 2, v:2),
                  if(isAndroid)
                  Container(
                    height: 60,width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appBar
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/Registration/google.svg",height: 30,width: 30),
                    ),
                  ).pSymmetric(h: 2, v:2),
                  if(isIOS)
                  Container(
                    height: 60,width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appBar
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/Registration/apple.svg",height: 30,width: 30),
                    ),
                  ).pSymmetric(h: 2, v:2),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 10 ,),

        ],
      ),
    );
  }
}
