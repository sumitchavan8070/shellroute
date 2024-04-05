import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';
import '../../upload_documents_module/components/additional_docs/upload_button.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: AppColors.appBar.withOpacity(0.3),
      child: Column(
        children: [
          Align(alignment:Alignment.centerLeft,child: Text("Comments", style: blackName,)).paddingOnly(bottom: 20)  ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                // height: 30, width: 30,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.green
                ),
                child: Center(
                  child: Text("SN", style: button,),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.shadow)
                ),
                
                width: MediaQuery.of(context).size.width * 0.62,
                child: IntrinsicHeight(
                  child: TextField(
                    // minLines: 2,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    style: eventSubtitle,
                    cursorColor: AppColors.subtitle,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      labelText: 'Write Comments',
                      labelStyle: subtitle,
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset("assets/images/pin.svg").paddingOnly(right: 10),
              const UploadButton(color: AppColors.primary, title: "SEND", height: 35, width: 100)
            ],
          ).paddingOnly(top: 10),
          const Divider(color: AppColors.subtitle,height: 1,thickness: 1,).paddingSymmetric(vertical: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.green
                ),
                child: Center(
                  child: Text("SN", style: button,),
                ),
              ).paddingOnly(right: 10),
              Text("Sankalp Navdhinge", style: blackText,)
            ],
          ),
          Align(alignment:Alignment.centerRight,child: Text("21/09/2023 03:07PM",style: eventTitle,)).paddingOnly(top: 20, bottom: 5),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.shadow)
            ),
            width: MediaQuery.of(context).size.width,
            child:  const Text("Dear Team,\n\nWe are not going to take this case forward as the applicant is from Bihar and completed a bachelor’s from Punjab, which is a GTE concern, hence we are closing this case.",
              style: TextStyle(
                color: AppColors.subtitle,
                fontWeight: FontWeight.w400,
                fontSize: 13
              ),
              maxLines: null,

            ),
          )


        ],
      ),
    ).paddingOnly(top: 30);
  }
}
