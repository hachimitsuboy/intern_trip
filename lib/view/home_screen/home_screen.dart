import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/data_models/user_trip_data.dart';
import 'package:intern_trip/models/database_manager.dart';
import 'package:intern_trip/provider/departure_date_provider.dart';
import 'package:intern_trip/provider/goal_provider.dart';
import 'package:intern_trip/provider/industry_provider.dart';
import 'package:intern_trip/provider/occupation_provider.dart';
import 'package:intern_trip/provider/user_trip_data_provider.dart';
import 'package:intern_trip/view/common_widgets/common_button.dart';
import 'package:intern_trip/view/home_screen/children/departure_date_picker.dart';
import 'package:intern_trip/view/home_screen/children/goal_drop_down_button.dart';
import 'package:intern_trip/view/home_screen/children/industry_drop_down_button.dart';
import 'package:intern_trip/view/home_screen/children/occupation_drop_down_button.dart';
import 'package:intern_trip/view/result_screen/result_screen.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);
  final dbManager = DatabaseManager();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          CommonButton(
              title: '検索',
              onPush: () {
                ref.read(userTripDataProvider.notifier).state = UserTripData(
                  goal: ref.read(goalProvider),
                  departureDate: ref.read(departureDateProvider),
                  industry: ref.read(industryProvider),
                  occupation: ref.read(occupationProvider),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ResultScreen(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
