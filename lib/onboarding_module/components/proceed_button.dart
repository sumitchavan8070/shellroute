import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/app_colors.dart';
import '../controller/getx_controller.dart';
import '../provider/post_onboarding_que.dart';

class ProceedSkipButton extends StatefulWidget {
  const ProceedSkipButton({
    super.key,
    this.pageIndex,
    required this.onPressed,
    this.onPressedSkip,
  });

  final int? pageIndex;
  final VoidCallback? onPressed;
  final VoidCallback? onPressedSkip;

  @override
  State<ProceedSkipButton> createState() => _ProceedSkipButtonState();
}

GetController _getXController = Get.find<GetController>();

var postDataInstance = PostOnboardingQuesClass();

class _ProceedSkipButtonState extends State<ProceedSkipButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor:
                      MaterialStatePropertyAll(AppColors.buton)),
              onPressed: widget.onPressedSkip,
              child: const Text(
                "SKIP",
                style: TextStyle(color: AppColors.subtitle),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: Obx(() => _getXController.isLoading.value == false
                ? ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        elevation: const MaterialStatePropertyAll(0),
                        backgroundColor:const MaterialStatePropertyAll(AppColors.primary)),
                    onPressed: widget.onPressed,
                    child: const Text(
                      "PROCEED",
                      style: TextStyle(color: AppColors.bg),
                    ),
                  )
                : Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  alignment: Alignment.center,
                  child: const SizedBox(
                    height: 30,width: 30,
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.bg,
                    ),
                  ),
                ),),
          ),
        ),
      ],
    ).pOnly(top: 0, bottom: 20);
  }
}
