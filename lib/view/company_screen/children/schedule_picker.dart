import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/functions/select_date.dart';
import 'package:intern_trip/provider/schedule_provider.dart';

class SchedulePicker extends ConsumerWidget {
  const SchedulePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = ref.watch(startDateToStringProvider);
    final endDate = ref.watch(endDateToStringProvider);
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            const Icon(
              Icons.date_range_outlined,
              size: 40,
            ),
            TextButton(
              onPressed: () => selectStartDate(context, ref),
              child: Text(
                startDate,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const Text(
              '〜',
              style: TextStyle(fontSize: 14),
            ),
            TextButton(
              onPressed: () => selectEndDate(context, ref),
              child: Text(
                endDate,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
