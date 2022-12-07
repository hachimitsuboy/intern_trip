import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/auth/provider/industry_provider.dart';

final List<String> industries = [
  '指定なし',
  'IT・通信',
  'メーカー（機械・\n電気）',
  'メーカー（素材・\n化学・食品）',
  'メーカー（医療・\n薬品）',
  'メーカー（その他）',
  '建設',
  '不動産',
  '医療・薬品',
  '金融',
  'コンサルティング\nリサーチ',
  '広告',
  'メディア',
  '総合商社',
  '専門商社',
  '人材',
  '教育',
  '運輸・物流',
  '小売',
  'エネルギー',
  '農林水産・鉱山',
  'その他',
];


class IndustriesDropDownButton extends ConsumerWidget {
  const IndustriesDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String industryDropdownValue = ref.watch(industryProvider);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: SizedBox(
        child: Row(
          children: [
            const Icon(
              Icons.factory,
              size: 40,
            ),
            const SizedBox(width: 5),
            const Text('業種：　', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 5),
            DropdownButton(
              underline: const SizedBox(),
              value: industryDropdownValue,
              items: industries.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ).toList(),
              onChanged: (String? value) {
                ref.read(industryProvider.notifier).state = value!;
              },
            ),
          ],
        ),
      ),
    );
  }
}
