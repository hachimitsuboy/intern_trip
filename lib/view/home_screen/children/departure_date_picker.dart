import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/functions/select_date.dart';
import 'package:intern_trip/provider/departure_date_provider.dart';

class DepartureDatePicker extends ConsumerWidget {
  const DepartureDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departureDate = ref.watch(departureDateToStringProvider);
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
            onPressed: () => selectTripDate(context, ref),
            child: Text(
              departureDate,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
