import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constants/text_styles.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

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
              SvgPicture.asset("assets/images/results.svg", height: 40,).paddingOnly(top: 20),
              const SizedBox(height: 4,),
              Text("Whatever happens we're here for you ",
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
//         Text("Whatever happens we're\nhere for you ",
//             style: smalltitle
//         ),
//         const SizedBox(height: 4,),
//         Text("Update your application status to\nfind your final list of universities\nhere.",
//           style: subtitle,
//         )
//       ],
//     ),
//     SvgPicture.asset("assets/images/results.svg")
//   ],
// ).pOnly(top: 15, bottom: 10),
// Container(
//   height: 30,width: MediaQuery.of(context).size.width,
//   color: AppColors.appBar.withOpacity(0.7),
//   child: InkWell(
//     onTap: () {
//       context.pushNamed("/application");
//     },
//     child: Center(
//       child: Text("+ Add Application",
//         style: underlinelinktext,
//       ),
//     ),
//   ),
// ),