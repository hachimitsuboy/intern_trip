import 'package:flutter/material.dart';
import 'package:intern_trip/view/common_widgets/common_button.dart';
import 'package:intern_trip/view/home_screen/children/departure_date_picker.dart';
import 'package:intern_trip/view/home_screen/children/goal_drop_down_button.dart';
import 'package:intern_trip/view/home_screen/children/industry_drop_down_button.dart';
import 'package:intern_trip/view/home_screen/children/occupation_drop_down_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日時検索'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          const Center(
              child: Text(
            '旅行日程からインターンを予約',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          const SizedBox(height: 70),
          const GoalDropDownButton(),
          const SizedBox(height: 20),
          const DepartureDatePicker(),
          const SizedBox(height: 20),
          const IndustriesDropDownButton(),
          const SizedBox(height: 20),
          const OccupationDropDownButton(),
          const SizedBox(height: 100),
          CommonButton(title: '検索', onPush: () {}),
        ],
      ),
    );
  }
}
