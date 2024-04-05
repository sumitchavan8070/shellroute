import 'package:flutter/material.dart';
import 'package:testinggetx/constants/text_styles.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/app_colors.dart';

class Apply extends StatefulWidget {
  const Apply({
    super.key,
    this.pageIndex,
    this.onPressed,
    this.onPressedClear,
  });

  final int? pageIndex;
  final VoidCallback? onPressed;
  final VoidCallback? onPressedClear;

  @override
  State<Apply> createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                  elevation: const MaterialStatePropertyAll(0),
                  backgroundColor:
                  const MaterialStatePropertyAll(Color(0xffDCDCDD))),
              onPressed: widget.onPressedClear,
              child: Text(
                "Clear",
                style: bigSubtitle,
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
            child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        elevation: const MaterialStatePropertyAll(0),
                        backgroundColor:
                        const MaterialStatePropertyAll(AppColors.primary)),
                    onPressed: widget.onPressed,
                    child: Text(
                      "Apply",
                      style: button,
                    ),
                  )

          ),
        ),
      ],
    ).pOnly(top: 0, bottom: 30, left: 20, right: 20);
  }
}
