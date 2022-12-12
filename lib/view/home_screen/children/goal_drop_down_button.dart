import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/provider/goal_provider.dart';

final List<String> prefectures = [
  '北海道',
  '青森県',
  '秋田県',
  '岩手県',
  '山形県',
  '宮城県',
  '新潟県',
  '福島県',
  '栃木県',
  '群馬県',
  '茨城県',
  '千葉県',
  '神奈川県',
  '埼玉県',
  '東京都',
  '山梨県',
  '長野県',
  '富山県',
  '岐阜県',
  '静岡県',
  '石川県',
  '愛知県',
  '福井県',
  '京都府',
  '滋賀県',
  '三重県',
  '奈良県',
  '大阪府',
  '和歌山県',
  '兵庫県',
  '鳥取県',
  '島根県',
  '岡山県',
  '広島県',
  '山口県',
  '香川県',
  '徳島県',
  '愛知県',
  '高知県',
  '福岡県',
  '佐賀県',
  '長崎県',
  '大分県',
  '熊本県',
  '宮崎県',
  '鹿児島県',
  '沖縄県'
];

class GoalDropDownButton extends ConsumerWidget {
  const GoalDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String dropdownValue = ref.watch(goalProvider);
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          const Icon(
            Icons.airplanemode_active,
            size: 40,
          ),
          const SizedBox(width: 5),
          const Text('目的地：　', style: TextStyle(fontSize: 16)),
          const SizedBox(width: 5),
          DropdownButton(
            icon: const SizedBox(),
            underline: const SizedBox(),
            value: dropdownValue,
            items: prefectures.map<DropdownMenuItem<String>>(
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
              ref.read(goalProvider.notifier).state = value!;
            },
          ),
        ],
      ),
    );
  }
}
