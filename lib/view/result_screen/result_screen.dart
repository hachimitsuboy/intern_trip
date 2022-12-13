import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/provider/get_intern_info_provider.dart';
import 'package:intern_trip/view/result_screen/children/intern_card.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final internList = ref.watch(getInternInfoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索結果'),
        centerTitle: true,
      ),
      body: Center(
        child: internList.when(
            data: (data) {
              return (data.isNotEmpty)
                  ? ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: data.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        return InternCard(
                          intern: data[index],
                        );
                      })
                  : const Center(
                      child: Text(
                        'ヒットなし',
                        style: TextStyle(fontSize: 32),
                      ),
                    );
            },
            error: (err, _) => Text(err.toString()),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
