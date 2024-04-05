import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testinggetx/constants/text_styles.dart';
import 'package:testinggetx/routes/go_path.dart';
import '../../../Components/delete_bottom_sheet.dart';
import '../../../Controller/getx_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constants/app_colors.dart';
import 'expansion_ontap_widget.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.list,
    required this.route
  });
  final String? title;
  final RxList<PlatformFile>? list;
  final String? route;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();

}
final controller = Get.put(GetXMainController());
Widget _childPopup({
  required BuildContext context,
  required String title,
  bool haveView = false,
  bool toRemove = false,
  RxList<PlatformFile>? selectedMap,
  String? selectedElement,
}) {
  return PopupMenuButton(
    color: AppColors.white,
    onSelected: (value) {
      if (value == 3) {
        bottomsheet(
          context: context,
          title: title,
          onTap: () {
            if(title == 'LOR1' || title == 'LOR2'){
              selectedMap![int.tryParse(selectedElement!) ?? 0] = PlatformFile(
                name: selectedMap[int.parse(selectedElement)].name.toString(),
                size: 0,
                path: null,
              );
              if (kDebugMode) {
                print(selectedMap.toString());
              }
              context.findAncestorStateOfType<NavigatorState>()?.pop();
            }
            else if (title.endsWith('.jpg') || title.endsWith('.png') || title.endsWith('.pdf') || title.endsWith('.jpeg')) {
              selectedMap?.removeAt(int.parse(selectedElement!));
              if (kDebugMode) {
                print(selectedMap.toString());
              }

              context.findAncestorStateOfType<NavigatorState>()?.pop();
            }
            else if (toRemove) {
              if (selectedMap != null) {
                selectedMap[int.tryParse(selectedElement!) ?? 0] = PlatformFile(
                  name: selectedMap[int.parse(selectedElement)].name.toString(),
                  size: 0,
                  path: null,
                );
                if (kDebugMode) {
                  print(selectedMap.toString());
                }
              }
              context.findAncestorStateOfType<NavigatorState>()?.pop();
            }
          },
        );
      }
    },
    shape: RoundedRectangleBorder(
      side: const BorderSide(width: 0.50, color: Color(0x3F747579)),
      borderRadius: BorderRadius.circular(10),
    ),
    shadowColor: const Color(0x23000000),
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        height: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height - 29),
        child: haveView
            ? Column(children: [
          Row(
            children: [
              SizedBox(
                height: 20,
                width: 16,
                child: SvgPicture.asset('assets/images/sbyyou.svg'),
              ),
              const WidthBox(10),
              GestureDetector(
                onTap: () {

                  // context.push(GoPath.uploadPageFirstPartWithData());
             GoRouter.of(context).push(GoPath.uploadPageFirstPartWithData(title2: 'skdfhds', title1: 'skdfhksd'));
                  // context.pushNamed(GoPath.viewLorDetails,
                  //   pathParameters: {
                  //     'title' : selectedMap![int.parse(selectedElement!)].name.toString(),
                  //   }
                  // );
                },
                child: const Text(
                  'View Details',
                  style: TextStyle(
                    color: AppColors.subtitle,
                    fontSize: 16,
                    fontFamily: 'Heebo',
                    fontWeight: FontWeight.w400,
                    height: 1.25,
                  ),
                ),
              ),
            ],
          ),
        ])
            : Column(children: [
          Row(
            children: [
              SizedBox(
                height: 20,
                width: 16,
                child: SvgPicture.asset('assets/images/download.svg'),
              ),
              const WidthBox(10),
              const Text(
                'Download',
                style: TextStyle(
                  color: AppColors.subtitle,
                  fontSize: 16,
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ]),
      ),
      PopupMenuItem(
          enabled: false,
          padding: const EdgeInsets.all(0),
          height: 0.1,
          value: 2,
          child: Container(
            margin:
            const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
            height: 1,
            width: double.infinity,
            color: AppColors.subtitle,
          )),
      PopupMenuItem(
        value: 3,
        height: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height - 29),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 16,
                  child: SvgPicture.asset(
                    'assets/images/delete.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                const WidthBox(10),
                const Text(
                  'Delete',
                  style: TextStyle(
                    color: AppColors.subtitle,
                    fontSize: 16,
                    fontFamily: 'Heebo',
                    fontWeight: FontWeight.w400,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
    child: SizedBox(
      height: 20.8,
      width: 21,
      child: SvgPicture.asset(
        'assets/images/dotmenu.svg',
        fit: BoxFit.fitWidth,
      ),
    ),
  );
}
class _CustomExpansionTileState extends State<CustomExpansionTile> {
  List<bool> isOpen = [false];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: isOpen[0]
              ? const BorderSide(width: 1, color: Color(0xFFFFE0D3))
              : const BorderSide(color: AppColors.secondaryBg),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: ExpansionPanelList.radio(
        expandedHeaderPadding: const EdgeInsets.all(0),
        dividerColor: AppColors.primary,
        elevation: 0,
        children: [
          ExpansionPanelRadio(
            backgroundColor: isOpen[0]
                ? AppColors.upload
                : AppColors.secondaryBg,
            canTapOnHeader: true,
            body: Obx(
              () => Column(
                children:
                  List.generate(widget.list!.length, (index) {
                    final file = widget.list![index];
                    final isLast = index == widget.list!.length - 1;
                    return file.path == null
                          ? bodyPart(
                            title: file.name,
                            isLast: isLast,
                            onTap: () {
                              if(file.name == 'LOR1' || file.name == "LOR2"){
                                final name = widget.list;
                                String? fileIndex = index.toString();
                                context.pushNamed(
                                  GoPath.lorDetails,
                                  pathParameters: {
                                    'title1': file.name,
                                    'title2': '1 file added',
                                    'index': fileIndex,
                                  },
                                  extra: name,
                                );
                              }
                              else{
                                final name = widget.list;
                                String? fileIndex = index.toString();
                                context.pushNamed(
                                  '${widget.route}',
                                  pathParameters: {
                                    'index': fileIndex,
                                    'title1': file.name,
                                    'title2': '1 file added',
                                  },


                                  extra: name,
                                );
                              }

                            },
                            context: context, color: AppColors.secondaryBg,
                          )
                          : bodyAfterUpload(
                          title: file.name,
                          isLast: isLast,
                          widget:
                          _childPopup(
                            haveView: file.name == 'LOR1'
                                ? true
                                : file.name == 'LOR2' ?true :false,
                            toRemove: true,
                            context: context,
                            selectedElement: index.toString(),
                            title: file.name.toString(),
                            selectedMap: widget.list,
                          ),
                        context: context,
                      );
                  })
              ),
            ),
            value: 0,
            headerBuilder: (BuildContext context, isExpanded) {
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                horizontalTitleGap: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(40),
                    bottomEnd: Radius.circular(50),
                  ),
                ),
                minVerticalPadding: 0,
                title: Text(
                  widget.title.toString(),
                  style: blackText,
                ).pSymmetric(h: 10, v: 10),
                // trailing: Icon(Icons.access_alarm),
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



class CustomTile extends StatefulWidget {
  const CustomTile({
    super.key,
    required this.list,
    required this.route
  });
  final RxList<PlatformFile>? list;
  final String? route;

  @override
  State<CustomTile> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Column(
          children:
          List.generate(widget.list!.length, (index) {
            final file = widget.list![index];
            final isLast = index == widget.list!.length - 1;
            return file.path == null
                ? bodyPart(
              title: file.name,
              isLast: isLast,
              onTap: () {
                final name = widget.list;
                String? fileIndex = index.toString();
                context.pushNamed(
                  '${widget.route}',
                  pathParameters: {
                    'index': fileIndex,
                    'title1': file.name,
                    'title2': '1 file added',
                  },
                  extra: name,
                );
              },
              context: context, color: AppColors.white,
            )
                : bodyAfterUpload(
              title: file.name,
              isLast: isLast,
              widget: _childPopup(
                toRemove: true,
                context: context,
                selectedElement: index.toString(),
                title: file.name.toString(),
                selectedMap: widget.list,
              ),
              context: context,
            );
          })
      ),
    );
  }
}
