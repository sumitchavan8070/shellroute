import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testinggetx/Components/application_manager/comments.dart';
import '../../constants/app_colors.dart';
import '../../constants/text_styles.dart';

class ApplicationCard extends StatefulWidget {
  const ApplicationCard({
    super.key,
    required this.title,
    required this.university,
    this.priority,
    required this.show,
    required this.qualified,
  });
  final String? title;
  final String? university;
  final String? priority;
  final bool? show;
  final String? qualified;

  @override
  State<ApplicationCard> createState() => _ApplicationCardState();
}

class _ApplicationCardState extends State<ApplicationCard> {
  List<bool> isOpen = [false];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: isOpen[0]
              ? const BorderSide(width: 1, color: AppColors.shadow)
              : const BorderSide(color: AppColors.shadow),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: ExpansionPanelList.radio(
        expandedHeaderPadding: const EdgeInsets.all(0),
        dividerColor: AppColors.primary,
        elevation: 0,
        children: [
          ExpansionPanelRadio(
            backgroundColor: isOpen[0]
                ? AppColors.appBar.withOpacity(0.5)
                : Colors.transparent,
            canTapOnHeader: true,
            body: Container(
              color: AppColors.white,
              child: Column(
                children: [
                  const Divider(color: AppColors.shadow,height: 1, thickness: 1,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width *0.4,
                            child: Text("21/09/2023 03:07PM",style: eventTitle,)
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width *0.4,
                              child: Text("Applied Through Gradding", style: eventSubtitle,)
                          ),
                        ],
                      ),
                      Text("18867/23", style: linkText,).paddingSymmetric(vertical: 6),
                      RichText(
                        text: TextSpan(
                          text: "Intake: ",style: eventSubtitle,
                          children: [
                            TextSpan(
                              text: "Feb-2024", style: eventTitle
                            )
                          ]
                        ),
                      ),
                      const Comments()
                    ],
                  ).paddingSymmetric(horizontal: 15, vertical: 15),
                ],
              ),
            ),
            value: 0,
            headerBuilder: (BuildContext context, isExpanded) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title!, style: eventTitle,),
                    Text(widget.university!, style: subtitle,).paddingOnly(top: 5, bottom: 5),
                    Visibility(
                      visible: widget.show!,
                      child: IntrinsicWidth(
                          child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                              decoration: BoxDecoration(
                                  color: AppColors.subtitle,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                  child: Text(
                                    widget.priority.toString(),
                                    style: button,
                                  )
                              )
                          )
                      ).paddingSymmetric(vertical: 10),
                    ),
                    Text(widget.qualified!, style: smallTitle,),
                  ],
                ),
              );
            },
          ),
        ],
        expansionCallback: (index, isExpanded) {
          setState(() {
            isOpen[0] = !isExpanded;
            // TODO: make it like radio expansionPanelList
          });
        },
      ),
    );
  }
}

