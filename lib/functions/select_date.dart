import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/auth/provider/departure_date_provider.dart';
import 'package:intern_trip/auth/provider/schedule_provider.dart';

Future<void> selectTripDate(BuildContext context, WidgetRef ref) async {
  final DateTime? selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2022),
    lastDate: DateTime(2024),
  );
  if (selected != null) {
    ref.read(departureDateProvider.notifier).state = selected;
  }
}

Future<void> selectStartDate(BuildContext context, WidgetRef ref) async {
  final DateTime? selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2022),
    lastDate: DateTime(2024),
  );
  if (selected != null) {
    ref.read(startDateProvider.notifier).state = selected;
  }
}

Future<void> selectEndDate(BuildContext context, WidgetRef ref) async {
  final DateTime? selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2022),
    lastDate: DateTime(2024),
  );
  if (selected != null) {
    ref.read(endDateProvider.notifier).state = selected;
  }
}
