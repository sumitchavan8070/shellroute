import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:testinggetx/upload_documents_module/components/additional_docs/card.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Components/delete_bottom_sheet.dart';
import '../../Controller/getx_main_controller.dart';
import '../../constants/app_colors.dart';
import '../../routes/go_path.dart';
import '../components/custom_widget/expansion_ontap_widget.dart';

class AdditionalDocs extends StatefulWidget {
  const AdditionalDocs({super.key});

  @override
  State<AdditionalDocs> createState() => _AdditionalDocsState();
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
                  context.pushNamed(GoPath.viewLorDetails,
                      pathParameters: {
                        'title' : selectedMap![int.parse(selectedElement!)].name.toString(),
                      }
                  );
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
class _AdditionalDocsState extends State<AdditionalDocs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const UploadCard(),
            const SizedBox(height: 20,),
            Obx(
                  () => Column(
                  children:
                  List.generate(controller.additional.length, (index) {
                    final file = controller.additional[index];
                    final isLast = index == controller.additional.length - 1;
                    return file.path == null
                        ? const SizedBox()
                        : bodyAfterUpload(
                      title: file.name,
                      isLast: isLast,
                      widget: _childPopup(
                        toRemove: true,
                        context: context,
                        selectedElement: index.toString(),
                        title: file.name.toString(),
                        selectedMap: controller.additional,
                      ),
                      context: context,
                    );
                  })
              ),
            )
          ],
        ),
      ),


    );
  }
}
