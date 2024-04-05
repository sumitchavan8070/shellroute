import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constants/text_styles.dart';

class Watchlisted extends StatefulWidget {
  const Watchlisted({super.key});

  @override
  State<Watchlisted> createState() => _WatchlistedState();
}

class _WatchlistedState extends State<Watchlisted> {

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
              SvgPicture.asset("assets/images/watchlisted.svg", height: 40,).paddingOnly(top: 20),
              const SizedBox(height: 4,),
              Text("Look Out for the Stars!",
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
//         Text("Look Out for the Stars!",
//             style: smalltitle
//         ),
//         const SizedBox(height: 4,),
//         RichText(text: TextSpan(
//             text: "Head out to",
//             style: subtitle,
//             children: [
//               TextSpan(text: ' "Explore"',
//                   style: ornagesubtitile
//               ),
//               TextSpan(text: " and click",
//                 style: subtitle,)
//             ]
//         ),
//         ),
//         Text("the star on a University you like\nto add them here.",
//           style: subtitle,
//         ),
//       ],
//     ),
//     SvgPicture.asset("assets/images/watchlisted.svg")
//   ],
// ).pOnly(top: 15, bottom: 10),