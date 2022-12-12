import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/provider/industry_provider.dart';

final List<String> industries = [
  '指定なし',
  'IT・通信',
  'メーカー（機械・電気）',
  'メーカー（素材・化学・食品）',
  'メーカー（医療・薬品）',
  'メーカー（その他）',
  '建設',
  '不動産',
  '医療・薬品',
  '金融',
  'コンサルティングリサーチ',
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

class CompanyIndustriesDropDownButton extends ConsumerWidget {
  const CompanyIndustriesDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String industryDropdownValue = ref.watch(industryProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            const Icon(
              Icons.factory,
              size: 40,
            ),
            const SizedBox(width: 8),
            DropdownButton(
              icon: const SizedBox(),
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
