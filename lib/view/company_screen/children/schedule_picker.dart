import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/auth/provider/schedule_provider.dart';

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
              onPressed: () => _selectStartDate(context, ref),
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
              onPressed: () => _selectEndDate(context, ref),
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

  Future<void> _selectStartDate(BuildContext context, WidgetRef ref) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    );
    if (selected != null) {
      final startDate = selected;
      ref.read(startDateProvider.notifier).state = startDate;
    }
  }

  Future<void> _selectEndDate(BuildContext context, WidgetRef ref) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    );
    if (selected != null) {
      final endDate = selected;
      ref.read(endDateProvider.notifier).state = endDate;
    }
  }
}
