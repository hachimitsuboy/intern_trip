import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/auth/provider/occupation_provider.dart';

final List<String> occupations = [
  '指定なし',
  '研究開発職',
  '設計・開発職（メカ・部品等）',
  '生産技術・工法開発・生産管理職',
  '品質管理・メンテナンス',
  'システムエンジニア',
  '組み込み開発エンジニア',
  'AIエンジニア',
  'データサイエンティスト',
  'Webエンジニア',
  'ネットワーク/インフラエンジニア',
  'セキュリティエンジニア',
  'システム運用・保守',
  '建築設計',
  'プラントエンジニア',
  '知的財産部門',
  'その他技術色',
  '技術営業（セールスエンジニア）',
  'ゲーム系エンジニア',
  'Webプロデューサー・ディレクター',
  'Webデザイナー・UI/UXデザイナー',
  'コンサルタント',
  '金融専門職',
  'マーケティング・商品企画',
  '総合職',
  '企画・管理',
  '営業',
  '医師',
  '看護師',
  '歯科医',
  '薬剤師',
  '医療技師（臨床検査技師など）',
  'その他',
];

class OccupationDropDownButton extends ConsumerWidget {
  const OccupationDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String occupationDropdownValue = ref.watch(occupationProvider);

    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.black38,
        ),
      )),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          const Icon(
            Icons.work,
            size: 40,
          ),
          const SizedBox(width: 5),
          const Text('職種：　', style: TextStyle(fontSize: 16)),
          const SizedBox(width: 5),
          DropdownButton(
            icon: const SizedBox(),
            underline: const SizedBox(),
            value: occupationDropdownValue,
            items: occupations.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 3,
                  ),
                );
              },
            ).toList(),
            onChanged: (String? value) {
              ref.read(occupationProvider.notifier).state = value!;
            },
          ),
        ],
      ),
    );
  }
}
