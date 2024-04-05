import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
class SubmitButton extends StatefulWidget {
  const SubmitButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String? title;
  final VoidCallback? onPressed;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  elevation: const MaterialStatePropertyAll(0),
                  backgroundColor:const MaterialStatePropertyAll(AppColors.primary)),
              onPressed: widget.onPressed,
              child: Text(
                "${widget.title}",
                style: button
              ),
            ),
          ),
        ),
      ],
    ).pSymmetric(h: 10);
  }
}
