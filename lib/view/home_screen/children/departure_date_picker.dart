import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/auth/provider/departure_date_provider.dart';

class DepartureDatePicker extends ConsumerWidget {
  const DepartureDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departureDate = ref.watch(departureDateProvider);
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black38))),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          const Icon(
            Icons.date_range_outlined,
            size: 40,
          ),
          const Text(
            '出発日： ',
            style: TextStyle(fontSize: 16),
          ),
          TextButton(
            onPressed: () => _selectDate(context, ref),
            child: Text(
              departureDate,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    );
    if (selected != null) {
      final departureDate =
          '${selected.year}年${selected.month}月${selected.day}日';
      ref.read(departureDateProvider.notifier).state = departureDate;
    }
  }
}
