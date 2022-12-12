import 'package:flutter/material.dart';
import 'package:intern_trip/utils/constants.dart';
import 'package:intern_trip/view/company_screen/company_screen.dart';
import 'package:intern_trip/view/home_screen/home_screen.dart';

void toHomeOrCompanyScreen(UserType userType, BuildContext context) {
  if (userType == UserType.user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(),
      ),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CompanyScreen(),
      ),
    );
  }
}
