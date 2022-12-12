import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/provider/text_count_provider.dart';

class EventContentTextFormField extends ConsumerWidget {
  final TextEditingController textEditingController;

  const EventContentTextFormField({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textCount = ref.watch(textCountProvider);
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          controller: textEditingController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: (value) {
            ref.read(textCountProvider.notifier).state = value;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '${textCount.length}字',
            counterStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
