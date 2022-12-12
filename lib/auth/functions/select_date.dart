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
    final departureDate = '${selected.year}年${selected.month}月${selected.day}日';
    ref.read(departureDateProvider.notifier).state = departureDate;
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
    final startDate = selected;
    ref.read(startDateProvider.notifier).state = startDate;
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
    final endDate = selected;
    ref.read(endDateProvider.notifier).state = endDate;
  }
}
