import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:testinggetx/Controller/api_controller.dart';

import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  ApiController controller = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value? Container(): Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.subtitle.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: controller.getUserModal!.data.avatar.toString(),
                              fit: BoxFit.fill,
                              // placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                        ).paddingOnly(right: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${controller.getUserModal!.data.firstName} ${controller.getUserModal!.data.lastName}",
                              style: eventTitle,
                            ),
                            Row(
                              children:  [
                                SvgPicture.asset("assets/images/call.svg"),
                                const SizedBox(width: 5,),
                                Text(controller.getUserModal!.data.firstName,
                                  style: eventTitle,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                SvgPicture.asset("assets/images/mail.svg", height: 10,).paddingOnly(top: 4),
                                const SizedBox(width: 5,),
                                Text(controller.getUserModal!.data.email,
                                  style: const TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontFamily: 'Heebo',
                                    fontWeight: FontWeight.w400,
                                    height: 1.22,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 33,
                      lineWidth: 3.0,
                      percent: 0.6,
                      center: Text("60%",
                        style: title,
                      ),
                      progressColor: Colors.green.shade400,
                    )

                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Update Profile",
                  style: eventLinkText
                )
              ],
            ).paddingOnly(top: 20)
          ],
        ),
      )
    );
  }
}
