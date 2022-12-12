import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/provider/occupation_provider.dart';

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

class CompanyOccupationDropDownButton extends ConsumerWidget {
  const CompanyOccupationDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String occupationDropdownValue = ref.watch(occupationProvider);

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
              Icons.work,
              size: 40,
            ),
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
                      style: const TextStyle(fontSize: 16),
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
      ),
    );
  }
}
