// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:testinggetx/Components/application_manager/application_card.dart';

class Watchlisted extends StatelessWidget {
  const Watchlisted({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ApplicationCard(
          title: "Master of Health Administration",
          university: "Curtin University",
          priority: "2nd Priority",
          show: true,
          qualified: "Case Closed- Student Not Qualified",
        ),
        ApplicationCard(
          title: "Master of Biotechnology Management",
          university: "La Trobe University, Melbourne",
          show: false,
          qualified: "Conditional Offer Received",
        ),
        ApplicationCard(
          title: "Master of Pharmacy",
          university: "University of Western Australia",
          show: false,
          qualified: "Case Closed",
        ),
        ApplicationCard(
          title: "Master of Biotechnology Management",
          university: "La Trobe University, Melbourne",
          show: false,
          qualified: "Conditional Offer Received",
        ),
      ],
    );
  }
}
