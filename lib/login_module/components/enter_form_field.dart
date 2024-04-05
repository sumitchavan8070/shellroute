import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';

class EnterFormField extends StatelessWidget {
  final String lableText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isReadOnly;
  final Widget? icon;
  final bool? enabled;
  final InputBorder? disable;
  final int? maxlines;

  const EnterFormField({
    super.key,
    required this.lableText,
    this.validator,
    required this.inputFormatters,
    this.controller,
    this.isReadOnly = false,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
    this.icon,
    this.enabled,
    this.disable,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      autofocus: false,
      controller: controller,
      readOnly: isReadOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.subtitle,
      obscuringCharacter: "*",
      validator: validator,
      maxLines: maxlines,
      autocorrect: autocorrect,
      onChanged: onChanged,
      style: const TextStyle(
          color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        labelText: lableText,
        prefixIcon: icon,
        labelStyle: const TextStyle(
          color: AppColors.subtitle
        ),
        alignLabelWithHint: true,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.shadow
          )
        ),
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.shadow
            )
        ),
        floatingLabelStyle: const TextStyle(
            color: AppColors.subtitle
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.shadow
            )
        ),
      ),
    ).pOnly(bottom: 10);
  }
}


class EnterPasswordField extends StatefulWidget {

  final String lableText;
  final String? errorText;
  final TextEditingController? controller;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const EnterPasswordField({
    super.key,
    required this.lableText,
    this.errorText,
    required this.validator,
    required this.inputFormatters,
    this.controller,
    this.obscureText = true,
    this.onChanged,
  });

  @override
  State<EnterPasswordField> createState() => _EnterPasswordFieldState();
}

class _EnterPasswordFieldState extends State<EnterPasswordField> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        scrollPadding: const EdgeInsets.only(bottom: 600),
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: widget.inputFormatters,
        keyboardType: TextInputType.text,
        obscureText: show,
        obscuringCharacter: "*",
        validator: widget.validator,
        onChanged: widget.onChanged,
        cursorColor: AppColors.subtitle,
        style: blackText,
        decoration: InputDecoration(
          errorText: widget.errorText,
          // counterText: "hello",
          labelText: widget.lableText,
            labelStyle: TextStyle(
                color: AppColors.subtitle.withOpacity(0.7)
            ),
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.subtitle.withOpacity(0.5)
              )
          ),
          floatingLabelStyle: const TextStyle(
              color: AppColors.subtitle
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.subtitle.withOpacity(0.5)
              )
          ),
          suffix: GestureDetector(
            onTap: () {
              setState(() {
                if(show){ //if passenable == true, make it false
                  show = false;
                }else{
                  show = true; //if passenable == false, make it true
                }
              });
            },
            child: Container(
              child: show == true
                ? SvgPicture.asset("assets/images/Registration/password.svg", height: 15,width: 15,)
                :const Icon(Icons.remove_red_eye,color: AppColors.subtitle,size: 20),
            ),
          )
        ),
      ),
    );
  }
}
