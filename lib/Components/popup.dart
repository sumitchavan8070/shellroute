import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'delete_bottom_sheet.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      icon: SvgPicture.asset("assets/images/dotmenu.svg"),
      // icon: Icon(Icons.more_vert,color: Colors.grey,),
      itemBuilder: (context) {
        return
          [
            PopupMenuItem(
                value: 'Download',
                child: Column(
                  children: [
                    InkWell(
                        onTap: () async {
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/images/download.svg"),
                            const SizedBox(width: 10,),
                            const Text("Download"),
                          ],
                        )
                    ),
                    // Divider(color: AppColors.subtitle.withOpacity(0.5), thickness: 1,).paddingOnly(top: 10, bottom: 10),

                  ],
                )
                    // .paddingSymmetric(vertical: 10)
            ),
            PopupMenuItem(
                value: 'Delete',
                child:InkWell(
                    onTap: () async {
                      bottomsheet(context: context, title: "Visa Card", onTap: context.pop);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/delete.svg"),
                        const SizedBox(width: 10),
                        const Text("Delete"),
                      ],
                    ))
            ),
          ];
      },
      onSelected: (String value) {
        if (kDebugMode) {
          print('You Click on po up menu item');
        }
      },
    );
  }
}
