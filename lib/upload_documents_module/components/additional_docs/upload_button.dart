import 'package:flutter/material.dart';
import 'package:testinggetx/constants/text_styles.dart';

class UploadButton extends StatefulWidget {
  final Color? color;
  final VoidCallback? onPressed;
  final String? title;
  final double? height;
  final double? width;

  const UploadButton({super.key ,required this.color, required this.title, required this.height, required this.width, this.onPressed});

  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        onLongPress: () {},
        onFocusChange: (value) {},
        onHover: (value) {},
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          minimumSize: const Size(88, 36),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: Text(
          "${widget.title}",
          style: button,
        ),
      ),
    );
  }
}
