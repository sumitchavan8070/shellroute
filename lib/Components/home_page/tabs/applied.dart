import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constants/text_styles.dart';

class Applied extends StatefulWidget {
  const Applied({super.key});

  @override
  State<Applied> createState() => _AppliedState();
}

class _AppliedState extends State<Applied> {

  double visible = 0.0; // Initial position above the screen

  @override
  void initState() {
    super.initState();
    // Add a delay before animating the logo
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        visible = 1.0; // Final position at the center of the screen
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 1000),
          opacity: visible,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/applied.svg", height: 40,).paddingOnly(top: 20),
              const SizedBox(height: 4,),
              Text("Breathe In. Breathe Out. Apply!",
                  style: eventTitle
              ).pOnly(bottom: 20),
            ],
          ),
        ),
      ],
    );
  }
}


// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text("Breathe In. Breathe Out. Apply!",
//             style: smalltitle
//         ),
//         const SizedBox(height: 4,),
//
//         Text("Apply to your Shortlisted\nuniversities to view track them.",
//           style: subtitle,
//         ),
//       ],
//     ),
//     SvgPicture.asset("assets/images/applied.svg")
//   ],
// ).pOnly(top: 15, bottom: 10),