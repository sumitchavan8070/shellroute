import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testinggetx/constants/text_styles.dart';
import 'package:velocity_x/velocity_x.dart';
bottomsheet(
    {required BuildContext context,
    required String title,
        required void Function()? onTap}) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    backgroundColor: Colors.white,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.42,
        child: Column(
          children: [
            Container(
              height: 54,
              decoration: const ShapeDecoration(
                color: Color(0xFFF5F7F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 7,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: SizedBox(
                      height: 16,
                      width: 18,
                      child: SvgPicture.asset(
                        'assets/images/blackcross.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ),
                    Text(
                  'Delete Document',
                  style: blackName
                )
              ]),
            ),
            SizedBox(
              height: 32,
              width: 26,
              child: SvgPicture.asset(
                'assets/images/delete.svg',
                fit: BoxFit.fill,
              ),
            ).pOnly(
                top: MediaQuery.of(context).size.height * 0.03,
                bottom: MediaQuery.of(context).size.height * 0.025),
            Text(
              'Are you sure you want to delete\n“$title”',
              textAlign: TextAlign.center,
              style: blackName
            ),
            const SizedBox(height: 5,),
            Text(
              'All of your data will be permanently removed.\nThis action can not be undone.',
              textAlign: TextAlign.center,
              style: eventSubtitle,
            ).pOnly(
              top: MediaQuery.of(context).size.height * 0.009,
              bottom: MediaQuery.of(context).size.height * 0.03,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  // bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                width: 165,
                height: 50,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE33D3D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'DELETE',
                  style: button
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

