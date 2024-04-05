import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/text_styles.dart';


class Features extends StatefulWidget {
  const Features({super.key,
    required this.title,
    required this.list
  });
  final String title;
  final List list;

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        // height: widget.list.length<6?MediaQuery.of(context).size.height * 0.18:MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.6))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title,
              style: bigSubtitle
            ).paddingOnly(left: 0, top: 5),
            const SizedBox(height: 10,),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.list.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 22,width: 22,
                          child: SvgPicture.asset(widget.list[index].svg, fit: BoxFit.fill,)),
                        const SizedBox(width: 5,),
                        Text(widget.list[index].name,
                          style: blackText,
                        ).pOnly(left: 5),
                        // SizedBox(height: 10,),
                      ],
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
